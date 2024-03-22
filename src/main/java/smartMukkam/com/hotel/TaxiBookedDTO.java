package smartMukkam.com.hotel;

public class TaxiBookedDTO {
	private int tid;
	private int uid;
	private int hoid;
	private int txoid;
	private int km;
	private String date;
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
	public int getTxoid() {
		return txoid;
	}
	public void setTxoid(int txoid) {
		this.txoid = txoid;
	}
	public int getKm() {
		return km;
	}
	public void setKm(int km) {
		this.km = km;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
