package dto;

import java.io.Serializable;

public class Vehicle implements Serializable {

	private static final long serialVersionUID = -4274700572038677000L;

	private String vehicleId; // 차량 아이디
	private String vname; // 차량 명
	private Integer unitPrice; // 가격
	private String description; // 상세 설명
	private String category; // 분류
	private long unitsInStock; // 재고수
	private String releaseDate; // 출시일
	private String condition; // 상태
	private String filename; // 이미지 파일
	private int quantity; //장바구니에 담은 개수
	
	public Vehicle() {
		super();
	}

	public Vehicle(String vehicleId, String vname, Integer unitPrice) {
		this.vehicleId = vehicleId;
		this.vname = vname;
		this.unitPrice = unitPrice;
	}

	public String getVehicleId() {
		return vehicleId;
	}

	public String getVname() {
		return vname;
	}

	public void setVname(String vname) {
		this.vname = vname;
	}

	public void setVehicleId(String vehicleId) {
		this.vehicleId = vehicleId;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}
	
	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	
	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
