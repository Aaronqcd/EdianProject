package inter;

//import org.apache.ibatis.annotations.Select;

import bean.Product;

public interface IProductOperation {
	//@Select("SELECT * FROM user WHERE id=#{id}")
	public Product selectProduct(int id);
	public void insertProduct(Product product);
	public void delete_product(int id);
}
