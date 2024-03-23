package smartMukkam.com.hotel;

public class ReviewDTO {
	private int tid;
	private int uid;
	private int hoid;
	private String review;
	private String comment;
	private String status;
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
	public int getHoid() {
		return hoid;
	}
	public void setHoid(int hoid) {
		this.hoid = hoid;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
