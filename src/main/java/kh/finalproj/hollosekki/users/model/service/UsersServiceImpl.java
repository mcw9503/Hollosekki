package kh.finalproj.hollosekki.users.model.service;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.users.model.dao.UsersDAO;

@Service
public class UsersServiceImpl implements UsersService {
	
	@Autowired
	private UsersDAO uDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int updatePwd(HashMap<String, String> map) {
		return uDAO.updatePwd(sqlSession, map);
	}

	@Override
	public int updateInfo(Users u) {
		return uDAO.updateInfo(sqlSession, u);
	}

	@Override
	public int insertImage(Image image) {
		return uDAO.insertImage(sqlSession, image);
	}

	@Override
	public int updateProfile(Users u) {
		return uDAO.updateProfile(sqlSession, u);
	}

	@Override
	public Image selectImage(int usersNo) {
		return uDAO.selectImage(sqlSession, usersNo);
	}

	@Override
	public int deleteImage(Image existingImage) {
		return uDAO.deleteImage(sqlSession, existingImage);
	}

	@Override
	public int deleteImage(int usersNo) {
		return uDAO.deleteImage(sqlSession, usersNo);
	}
	
	
}
