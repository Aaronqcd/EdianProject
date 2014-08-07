package mapper;

import bean.Product;

public interface UserMapper {
	public void insertUser(Product user);
	public Product getUser(String name);
}
