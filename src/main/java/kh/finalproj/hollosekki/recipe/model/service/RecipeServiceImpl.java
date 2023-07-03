package kh.finalproj.hollosekki.recipe.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Ingredient;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.common.model.vo.Review;
import kh.finalproj.hollosekki.recipe.model.dao.RecipeDAO;
import kh.finalproj.hollosekki.recipe.model.vo.Recipe;
import kh.finalproj.hollosekki.recipe.model.vo.RecipeElement;
import kh.finalproj.hollosekki.recipe.model.vo.RecipeOrder;

@Service
public class RecipeServiceImpl implements RecipeService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private RecipeDAO rDAO;
	
	@Override
	public int insertAttm(ArrayList<Image> thumImgList) {
		return rDAO.insertAttm(sqlSession, thumImgList);
	}
	
	@Override
	public int insertRecipe(Recipe r) {
		return rDAO.insertRecipe(sqlSession, r);
	}
	
	@Override
	public int insertOrder(ArrayList<RecipeOrder> orc) {
		return rDAO.insertOrder(sqlSession, orc);
	}
	
	@Override
	public int getListCount() {
		return rDAO.getListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Recipe> selectRecipeList(PageInfo pi) {
		return rDAO.selectRecipeList(sqlSession, pi);
	}
	
	@Override
	public ArrayList<Image> selectRecipeImageList() {
		return rDAO.selectRecipeImageList(sqlSession);
	}
	
	@Override
	@Transactional
	public Recipe recipeDetail(int foodNo, boolean yn) {
		int result = 0;
		if(yn) {
			result = rDAO.addCount(sqlSession, foodNo);
		}
		return rDAO.recipeDetail(sqlSession, foodNo);
	}
	
//	썸네일 이미지
	@Override
	public Image recipeDetailThum(int foodNo) {
		return rDAO.recipeDetailThum(sqlSession, foodNo);
	}
	
//	조리순서 이미지
	@Override
	public ArrayList<Image> recipeDetailOrder(int foodNo) {
		return rDAO.recipeDetailOrder(sqlSession, foodNo);
	}
	
//	조리 완성 이미지
	@Override
	public ArrayList<Image> recipeDetailComp(int foodNo) {
		return rDAO.recipeDetailComp(sqlSession, foodNo);
	}
	
	@Override
	public ArrayList<RecipeOrder> recipeDetailOrderText(int foodNo) {
		return rDAO.recipeDetailOrderText(sqlSession, foodNo);
	}
	
	@Override
	public int deleteRecipe(int foodNo) {
		return rDAO.deleteRecipe(sqlSession, foodNo);
	}
	
	@Override
	public int deleteOrder(int foodNo) {
		return rDAO.deleteOrder(sqlSession, foodNo);
	}
	
	@Override
	public int deleteImage(int foodNo) {
		return rDAO.deleteImage(sqlSession, foodNo);
	}
	
	@Override
	public int deleteThumImg(String thumDelRename) {
		return rDAO.deleteThumImg(sqlSession, thumDelRename);
	}
	
	@Override
	public int updateRecipe(Recipe r) {
		return rDAO.updateRecipe(sqlSession, r);
	}
	
	@Override
	public int deleteListImg(ArrayList<String> delOrderImgRename) {
		return rDAO.deleteListImg(sqlSession, delOrderImgRename);
	}
	
	@Override
	public int deleteComImg(ArrayList<String> comDelRename) {
		return rDAO.deleteComImg(sqlSession, comDelRename);
	}
	
	@Override
	public int insertThum(Image img) {
		return rDAO.insertThum(sqlSession, img);
	}
	
	@Override
	public ArrayList<Recipe> recentRecipeList() {
		return rDAO.recentRecipeList(sqlSession);
	}
	
	@Override
	public ArrayList<Recipe> mostRecipeList() {
		return rDAO.mostRecipeList(sqlSession);
	}
	
	@Override
	public ArrayList<Recipe> searchRecipe(String word) {
		return rDAO.searchRecipe(sqlSession, word);
	}
	
	@Override
	public ArrayList<Image> searchImage() {
		return rDAO.searchImage(sqlSession);
	}
	
	@Override
	public ArrayList<Recipe> ingredientSearch(String ingredient) {
		return rDAO.ingredientSearch(sqlSession, ingredient);
	}
	
	@Override
	public ArrayList<Recipe> situationSearch(String situation) {
		return rDAO.situationSearch(sqlSession, situation);
	}
	
	@Override
	public ArrayList<Recipe> typeSearch(String type) {
		return rDAO.typeSearch(sqlSession, type);
	}
	
	@Override
	public int reviewWrite(Review re) {
		return rDAO.reviewWrite(sqlSession, re);
	}
	
	@Override
	public ArrayList<Review> selectReview(int foodNo) {
		return rDAO.selectReview(sqlSession, foodNo);
	}
	
	@Override
	public int getReviewCount(int foodNo) {
		return rDAO.getReviewCount(sqlSession, foodNo);
	}
	
	@Override
	public ArrayList<Review> selectReviewList(PageInfo rpi, int foodNo) {
		return rDAO.selectReivewList(sqlSession, rpi, foodNo);
	}
	
	@Override
	public ArrayList<Ingredient> selectIngredient() {
		return rDAO.selectIngredient(sqlSession);
	}
	
	@Override
	public void insertIngredient(ArrayList<RecipeElement> reelList) {
		rDAO.insertIngredient(sqlSession, reelList);
	}
	
	@Override
	public void insertNewIngredient(String newI) {
		rDAO.insertNewIngredient(sqlSession, newI);
	}
	
	@Override
	public Ingredient selectNewIngredient(String newI) {
		return rDAO.selectNewIngredient(sqlSession, newI);
	}
	
	@Override
	public ArrayList<RecipeElement> selectRecipeElement(int foodNo) {
		return rDAO.selectRecipeElement(sqlSession, foodNo);
	}
}
