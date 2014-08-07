package bean;

public class Product {
	private int id;
	private String name;
	private String picture;
	private int status;
	private int sort;
	private String type;
	
	public Product() {
		
	}
	
	public Product(int id, String name, String picture, int status, int sort, String type) {
		super();
		this.id = id;
		this.name = name;
		this.picture = picture;
		this.status = status;
		this.sort = sort;
		this.type = type;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getSort() {
		return sort;
	}

	public void setSort(int sort) {
		this.sort = sort;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String toString() {
		return "User [id=" + id + ", name=" + name + ", picture=" + picture + ", status=" + status + ", sort=" + sort + "]";
	}
}
