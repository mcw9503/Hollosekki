package kh.finalproj.hollosekki.recipe.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.recipe.model.dao.RecipeDAO;
import kh.finalproj.hollosekki.recipe.model.vo.Recipe;

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
}
