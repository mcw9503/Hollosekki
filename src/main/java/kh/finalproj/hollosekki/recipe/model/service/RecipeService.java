package kh.finalproj.hollosekki.recipe.model.service;

import java.util.ArrayList;

import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.recipe.model.vo.Recipe;

public interface RecipeService {

	int insertAttm(ArrayList<Image> thumImgList);

	int insertRecipe(Recipe r);

	int getListCount();

	ArrayList<Recipe> selectRecipeList(PageInfo pi);

	ArrayList<Image> selectRecipeImageList();

}
