package kh.finalproj.hollosekki.common.model.vo;

public class Menu extends Product{
	private String menuName;
	private int menuNo;
	private int menuKind;
	private int menuType;
	private String menuContent;
	private String foodProductNo;
	private String menuTarget;
	private String nutrient;
	private int productPrice;
	private Double productSale;
	private String imageRenameName;
	private String name;
	private String title;
	private String career;
	private int menuCount;
	private int usersNo;
	
	
	public Menu() {
		super();
	}


	public Menu(String menuName, int menuNo, int menuKind, int menuType, String menuContent, String foodProductNo,
			String menuTarget, String nutrient, int productPrice, Double productSale, String imageRenameName, String name, String title, String career,
			int menuCount, int usersNo) {
		super();
		this.menuName = menuName;
		this.menuNo = menuNo;
		this.menuKind = menuKind;
		this.menuType = menuType;
		this.menuContent = menuContent;
		this.foodProductNo = foodProductNo;
		this.menuTarget = menuTarget;
		this.nutrient = nutrient;
		this.productPrice = productPrice;
		this.productSale = productSale;
		this.imageRenameName = imageRenameName;
		this.name = name;
		this.title = title;
		this.career = career;
		this.menuCount = menuCount;
		this.usersNo = usersNo;
	}


	public String getMenuName() {
		return menuName;
	}


	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}


	public int getMenuNo() {
		return menuNo;
	}


	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}


	public int getMenuKind() {
		return menuKind;
	}


	public void setMenuKind(int menuKind) {
		this.menuKind = menuKind;
	}


	public int getMenuType() {
		return menuType;
	}


	public void setMenuType(int menuType) {
		this.menuType = menuType;
	}


	public String getMenuContent() {
		return menuContent;
	}


	public void setMenuContent(String menuContent) {
		this.menuContent = menuContent;
	}


	public String getFoodProductNo() {
		return foodProductNo;
	}


	public void setFoodProductNo(String foodProductNo) {
		this.foodProductNo = foodProductNo;
	}


	public String getMenuTarget() {
		return menuTarget;
	}


	public void setMenuTarget(String menuTarget) {
		this.menuTarget = menuTarget;
	}


	public String getNutrient() {
		return nutrient;
	}


	public void setNutrient(String nutrient) {
		this.nutrient = nutrient;
	}


	public int getProductPrice() {
		return productPrice;
	}


	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}


	public Double getProductSale() {
		return productSale;
	}


	public void setProductSale(Double productSale) {
		this.productSale = productSale;
	}


	public String getImageRenameName() {
		return imageRenameName;
	}


	public void setImageRenameName(String imageRenameName) {
		this.imageRenameName = imageRenameName;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getCareer() {
		return career;
	}


	public void setCareer(String career) {
		this.career = career;
	}
	
	public int getMenuCount() {
		return menuCount;
	}
	
	public void setMenuCount(int menuCount) {
		this.menuCount = menuCount;
	}
	
	public int getUsersNo() {
		return usersNo;
	}
	
	public void setUsersNo(int usersNo) {
		this.usersNo = usersNo;
	}

	@Override
	public String toString() {
		return "Menu [menuName=" + menuName + ", menuNo=" + menuNo + ", menuKind=" + menuKind + ", menuType=" + menuType
				+ ", menuContent=" + menuContent + ", foodProductNo=" + foodProductNo + ", menuTarget=" + menuTarget
				+ ", nutrient=" + nutrient + ", productPrice=" + productPrice + ", productSale=" + productSale
				+ ", imageRenameName=" + imageRenameName + ", name=" + name + ", title=" + title + ", career=" + career
				+ ", menuCount=" + menuCount + ", usersNo=" + usersNo + "]";
	}

	
}