package inter;

import java.util.List;

import bean.Product;

public interface UserDAO {
	public Product selectProduct(int id);
	public List<Product> selectByName(String name);
	public void insertName(Product product); 
	public void delete_product(int id);
	public List<Product> selectAllProduct();
	public void update(Product product);
	public List<Product> selectBySort(int sort);
}
