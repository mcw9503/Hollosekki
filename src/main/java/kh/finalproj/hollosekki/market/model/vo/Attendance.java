package kh.finalproj.hollosekki.market.model.vo;


public class Attendance {
	private String usersId;
	private String date;
	private String dateStr;
	private String checked;
	private String title;
	private int point;
	
	public Attendance() {}

	public Attendance(String usersId, String date, String dateStr, String checked, String title, int point) {
		super();
		this.usersId = usersId;
		this.date = date;
		this.dateStr = dateStr;
		this.checked = checked;
		this.title = title;
		this.point = point;
	}

	public String getUsersId() {
		return usersId;
	}

	public void setUsersId(String usersId) {
		this.usersId = usersId;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getDateStr() {
		return dateStr;
	}

	public void setDateStr(String dateStr) {
		this.dateStr = dateStr;
	}

	public String getChecked() {
		return checked;
	}

	public void setChecked(String checked) {
		this.checked = checked;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	@Override
	public String toString() {
		return "Attendance [usersId=" + usersId + ", date=" + date + ", dateStr=" + dateStr + ", checked=" + checked
				+ ", title=" + title + ", point=" + point + "]";
	}


	


	

		
}
