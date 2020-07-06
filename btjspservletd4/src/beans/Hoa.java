package beans;

public class Hoa {
	private int idHoa;
	private String tenHoa;
	private int soLuong;
	private int gia;

	public Hoa() {

	}

	public Hoa(int idHoa, String tenHoa, int soLuong, int gia) {
		super();
		this.idHoa = idHoa;
		this.tenHoa = tenHoa;
		this.soLuong = soLuong;
		this.gia = gia;
	}

	public int getIdHoa() {
		return idHoa;
	}

	public void setIdHoa(int idHoa) {
		this.idHoa = idHoa;
	}

	public String getTenHoa() {
		return tenHoa;
	}

	public void setTenHoa(String tenHoa) {
		this.tenHoa = tenHoa;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public int getGia() {
		return gia;
	}

	public void setGia(int gia) {
		this.gia = gia;
	}
	
	public int tongTien() {
		return this.soLuong * this.gia;
	}

	public String toString() {
		return "ID hoa: " + this.idHoa + "\nTên hoa: " + this.tenHoa + "\nSố lượng: " + this.soLuong + "\nGiá: "
				+ this.gia;
	}

}
