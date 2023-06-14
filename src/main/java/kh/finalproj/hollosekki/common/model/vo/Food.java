package kh.finalproj.hollosekki.common.model.vo;

import java.util.Date;

public class Food extends Product{
	private int productNo;
	private String foodName;
	private int foodKind;
	private int foodType;
	private String foodContent;
	private String foodTarget;
	private String foodTable;
	private String nutrient;
	
	private int productType;
	private int productPrice;
	private String productOption;
	private int productStock;
	private Date productCreateDate;
	private Date productModifyDate;
	private Double productSale;
	private int productCount;
	private String productStatus;
	
	private int orderCount;
	private int viewCount;
	private int likeCount;
	
	public Food() {}

	public Food(int productNo, String foodName, int foodKind, int foodType, String foodContent, String foodTarget,
			String foodTable, String nutrient, int productType, int productPrice, String productOption,
			int productStock, Date productCreateDate, Date productModifyDate, Double productSale, int productCount,
			String productStatus, int orderCount, int viewCount, int likeCount) {
		super();
		this.productNo = productNo;
		this.foodName = foodName;
		this.foodKind = foodKind;
		this.foodType = foodType;
		this.foodContent = foodContent;
		this.foodTarget = foodTarget;
		this.foodTable = foodTable;
		this.nutrient = nutrient;
		this.productType = productType;
		this.productPrice = productPrice;
		this.productOption = productOption;
		this.productStock = productStock;
		this.productCreateDate = productCreateDate;
		this.productModifyDate = productModifyDate;
		this.productSale = productSale;
		this.productCount = productCount;
		this.productStatus = productStatus;
		this.orderCount = orderCount;
		this.viewCount = viewCount;
		this.likeCount = likeCount;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public int getFoodKind() {
		return foodKind;
	}

	public void setFoodKind(int foodKind) {
		this.foodKind = foodKind;
	}

	public int getFoodType() {
		return foodType;
	}

	public void setFoodType(int foodType) {
		this.foodType = foodType;
	}

	public String getFoodContent() {
		return foodContent;
	}

	public void setFoodContent(String foodContent) {
		this.foodContent = foodContent;
	}

	public String getFoodTarget() {
		return foodTarget;
	}

	public void setFoodTarget(String foodTarget) {
		this.foodTarget = foodTarget;
	}

	public String getFoodTable() {
		return foodTable;
	}

	public void setFoodTable(String foodTable) {
		this.foodTable = foodTable;
	}

	public String getNutrient() {
		return nutrient;
	}

	public void setNutrient(String nutrient) {
		this.nutrient = nutrient;
	}

	public int getProductType() {
		return productType;
	}

	public void setProductType(int productType) {
		this.productType = productType;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductOption() {
		return productOption;
	}

	public void setProductOption(String productOption) {
		this.productOption = productOption;
	}

	public int getProductStock() {
		return productStock;
	}

	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}

	public Date getProductCreateDate() {
		return productCreateDate;
	}

	public void setProductCreateDate(Date productCreateDate) {
		this.productCreateDate = productCreateDate;
	}

	public Date getProductModifyDate() {
		return productModifyDate;
	}

	public void setProductModifyDate(Date productModifyDate) {
		this.productModifyDate = productModifyDate;
	}

	public Double getProductSale() {
		return productSale;
	}

	public void setProductSale(Double productSale) {
		this.productSale = productSale;
	}

	public int getProductCount() {
		return productCount;
	}

	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}

	public String getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}

	public int getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	@Override
	public String toString() {
		return "Food [productNo=" + productNo + ", foodName=" + foodName + ", foodKind=" + foodKind + ", foodType="
				+ foodType + ", foodContent=" + foodContent + ", foodTarget=" + foodTarget + ", foodTable=" + foodTable
				+ ", nutrient=" + nutrient + ", productType=" + productType + ", productPrice=" + productPrice
				+ ", productOption=" + productOption + ", productStock=" + productStock + ", productCreateDate="
				+ productCreateDate + ", productModifyDate=" + productModifyDate + ", productSale=" + productSale
				+ ", productCount=" + productCount + ", productStatus=" + productStatus + ", orderCount=" + orderCount
				+ ", viewCount=" + viewCount + ", likeCount=" + likeCount + "]";
	}
	
}
