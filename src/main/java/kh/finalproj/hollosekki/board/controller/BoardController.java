package kh.finalproj.hollosekki.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import kh.finalproj.hollosekki.board.exception.BoardException;
import kh.finalproj.hollosekki.board.model.service.BoardService;
import kh.finalproj.hollosekki.board.model.vo.Board;
import kh.finalproj.hollosekki.common.Pagination;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.enroll.model.service.EnrollService;
import kh.finalproj.hollosekki.enroll.model.vo.Users;

@SessionAttributes("cart")
@Controller
public class BoardController {

	@Autowired
	private BoardService bService;
	
	@Autowired
	private EnrollService eService;
	
//	@RequestMapping("freeBoard.bo")
//	public String freeBoard(@RequestParam(value="page",required=false) Integer currentPage, Model model, @ModelAttribute Board b) {
//		if(currentPage == null) {
//			currentPage = 1;
//		}
//		int listCount = bService.getFreeBoardListCount(0);
//		
//		
//		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
//		
//		ArrayList<Board> list = bService.freeBoardView(b, pi);
//		model.addAttribute("pi", pi);
//		model.addAttribute("list", list);
//		
//		return "freeBoard";
//	}
	
	@RequestMapping("detailFreeBoard.bo")
	public String selectFreeBoard(Model model,HttpSession session, 
			@RequestParam("bId") Integer bId, @RequestParam("writer") String writer, 
			@RequestParam(value="page",required=false) Integer page) {
		Users u = (Users)session.getAttribute("loginUser");
		String login = null;
		int usersNo = 0;
		if(u != null) {
			login = u.getNickName();
			usersNo = u.getUsersNo();
		}
		boolean yn = false;
		if(!writer.equals(login)) {
			yn = true;
		}
		ArrayList<Board> list = bService.selectReply(bId);
		Board blist = bService.selectBoard(bId, yn);
		ArrayList<Users> AllUsersList = eService.AllUsersList();
		if(blist != null) {
			model.addAttribute("blist", blist);
			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("login", login);
			model.addAttribute("usersNo", usersNo);
			model.addAttribute("aList", AllUsersList);
			
			return "detailFreeBoard";
		} else {
			throw new BoardException("게시글 열람에 실패했습니다.");
		}
		
	}
	
	@RequestMapping("insertReply.bo")
	public void insertReply(HttpServletResponse response, @ModelAttribute Board b) {
		
		bService.insertReply(b);
		ArrayList<Board> rlist = bService.selectReply(b.getProductNo());
		
		response.setContentType("application/json; charset=UTF-8");
		GsonBuilder gb = new GsonBuilder().setDateFormat("yy-MM-dd HH:mm");
		Gson gson = gb.create();
		try {
			gson.toJson(rlist, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}	
	
	@RequestMapping("replyDelete.bo")
	@ResponseBody
	public String replyDelete(@ModelAttribute Board b) {
		
		int result = bService.replyDelete(b);
		return result == 1 ? "success" : "fail";
	}
		
	@RequestMapping("reReply.bo")
	@ResponseBody
	public String reReply(@RequestParam(value="reviewContent",required=false) String reviewContent, @RequestParam(value="reviewWriter",required=false) String reviewWriter,
			@RequestParam(value="productNo",required=false) Integer productNo, @RequestParam(value="usersNo",required=false) Integer usersNo,@RequestParam(value="reviewNo",required=false) Integer reviewNo) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("reviewContent", reviewContent);
		map.put("reviewWriter", reviewWriter);
		map.put("productNo", productNo);
		map.put("reviewNo", reviewNo);
		map.put("usersNo", usersNo);
		
		int result = bService.reReply(map);
		return result == 1 ? "success" : "fail";
	}
	
	@RequestMapping("freeBoardWrite.bo")
	public String goToWriete() {
		return "freeBoardWrite";
	}

	
	@RequestMapping("freeBoardWriting.bo")
	@ResponseBody
	public String freeBoardWrite(Model model,HttpSession session,@RequestParam(value="boardContent",required=false) String boardContent, 
			@RequestParam(value="boardTitle",required=false) String boardTitle) {
		Users u = (Users)session.getAttribute("loginUser");
		int usersNo = 0;
		
		if(u != null) {
			usersNo = u.getUsersNo();
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("usersNo", usersNo);
		map.put("boardContent", boardContent);
		map.put("boardTitle", boardTitle);
		
		int b = bService.freeBoardWriting(map);
		System.out.println(b);
		return b == 1 ? "success" : "fail"; 
	}
	
	@RequestMapping("goToMyBoard.bo")
	public void goToMyBoard(HttpServletResponse response, Model model,HttpSession session) {
		Users u = (Users)session.getAttribute("loginUser");
		String login = null;
		if(u != null) {
			login = u.getNickName();
		}
		Board bblist = bService.firstSelectBoard(login);
		System.out.println(bblist);
		response.setContentType("application/json; charset=UTF-8");
		GsonBuilder gb = new GsonBuilder().setDateFormat("yy-MM-dd HH:mm");
		Gson gson = gb.create();
		try {
			gson.toJson(bblist, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("freeBoard.bo")
	public String freeBoardSearch(@RequestParam(value="category", required=false) String category,@RequestParam(value="search", required=false) String search, HttpSession session, @RequestParam(value="page", required=false) Integer currentPage,
			Model model) {
		
		Users u = (Users)session.getAttribute("loginUser");
		if(u != null) {
			int cart = eService.cartCount(u.getUsersNo());
			model.addAttribute("cart", cart);
		}
		
		if(currentPage == null) {
			
			currentPage = 1;
		}
		

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("search", search);
		
		int	listCount = bService.getCategoryFreeCount(map);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<Board> list = bService.freeBList(pi, map);
		
		ArrayList<Board> replySum = bService.getReplyCount(list);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("category", category);
		model.addAttribute("search", search);
		if(replySum != null) {
			model.addAttribute("replySum", replySum);
		}
		
		return "freeBoard";
	}
	
//	@RequestMapping("fileUpload.bo")
//	public void fileUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
//		response.setContentType("text/html;charset=utf-8");
//		PrintWriter out = response.getWriter();
//		String realFolder = request.getSession().getServletContext().getRealPath("fileUpload");
//		UUID uuid = UUID.randomUUID();
//		
//		String org_filename = file.getOriginalFilename();
//		String str_filename = uuid.toString() + org_filename;
//		
//
//		String filepath = realFolder + "\\" + str_filename;
//		
//		File f = new File(filepath);
//		if (!f.exists()) {
//			f.mkdirs();
//		}
//		file.transferTo(f);
//		
//		out.println("fileUpload/" + str_filename);
//		out.close();
//	}
	
	@RequestMapping("reWriteBoardInfo.bo")
	public void reWrieteBoardInfo(HttpServletResponse response,@RequestParam(value="boardNo", required=false) Integer boardNo,
			@RequestParam(value="nickName", required=false) String nickName,Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("boardNo", boardNo);
		map.put("nickName", nickName);
		
		Board bInfo = bService.reWrieteBoardInfo(map);
		System.out.println(bInfo);
		response.setContentType("application/json; charset=UTF-8");
		GsonBuilder gb = new GsonBuilder().setDateFormat("yy-MM-dd HH:mm");
		Gson gson = gb.create();
		try {
			gson.toJson(bInfo, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
		model.addAttribute("bInfo", bInfo);
	}
	
	@RequestMapping("reBoard.bo")
	@ResponseBody
	public String reWriteBoard(@RequestParam(value="boardNo", required=false) Integer boardNo,
			@RequestParam(value="usersNo", required=false) Integer usersNo,
			@RequestParam(value="boardTitle", required=false) String boardTitle,
			@RequestParam(value="boardContent", required=false) String boardContent,
			Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("boardNo", boardNo);
		map.put("usersNo", usersNo);
		map.put("boardContent", boardContent);
		map.put("boardTitle", boardTitle);
		
		int result = bService.reWriteBoard(map);
		
		return result == 1 ? "success" : "fail";
	}
	
	@RequestMapping("deleteBoard.bo")
	@ResponseBody
	public String deleteBoardAndReply(HttpSession session, @RequestParam(value="boardNo", required=false) Integer boardNo,
			@RequestParam(value="usersNo", required=false) Integer usersNo,
		@RequestParam(value="reviewWriter", required=false) String reviewWriter) {
		
		int checkUsersNo = 0;
		String isAdmin = null;
		Users u = (Users)session.getAttribute("loginUser");
		if(u != null) {
			isAdmin = u.getIsAdmin();
			checkUsersNo = u.getUsersNo();
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(isAdmin.equals('N') || usersNo == checkUsersNo) {
			map.put("boardNo", boardNo);
			map.put("usersNo", usersNo);
			map.put("reviewWriter", reviewWriter);
		}
		
		
		int result1 = bService.deleteBoard(map);
		bService.deleteReply(map);
		
		return result1 == 1 ? "success" : "fail";
	}
	
	@RequestMapping("preDetailBoard.bo")
	@ResponseBody
	public Board preDetailBoard(@RequestParam(value="boardNo",required=false) Integer boardNo) {
		Board result = bService.preDetailBoard(boardNo);
		
		return result;
	}
	
	@RequestMapping("nextDetailBoard.bo")
	@ResponseBody
	public Board nextDetailBoard(@RequestParam(value="boardNo",required=false) Integer boardNo) {
		Board result = bService.nextDetailBoard(boardNo);
		
		return result;
	}
	
	
}
