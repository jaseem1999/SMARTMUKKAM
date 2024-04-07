package smartMukkam.com.municipality;

public class ComplaintDTO {
	private int tid;
	private int uid;
	private String officer;
	private String complaint;
	private String status;
	private String committee;
	private String date;
	
	
	public String getCommittee() {
		return committee;
	}
	public void setCommittee(String committee) {
		this.committee = committee;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getOfficer() {
		return officer;
	}
	public void setOfficer(String officer) {
		this.officer = officer;
	}
	public String getComplaint() {
		return complaint;
	}
	public void setComplaint(String complaint) {
		this.complaint = complaint;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
