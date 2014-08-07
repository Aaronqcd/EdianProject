package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.context.annotation.Scope;

import util.SessionFactoryUtil;

import inter.UserDAO;
import bean.Product;

@Scope("prototype")
public class UserDAOImpl implements UserDAO{
	public Product selectProduct(int id) {
		SqlSession session = SessionFactoryUtil.getSqlSessionFactory().openSession();
		Product product = (Product)session.selectOne("inter.IProductOperation.selectProduct", id);
		session.close();
		return product;
	}
	
	public void insertName(Product product) {
		SqlSession session = SessionFactoryUtil.getSqlSessionFactory().openSession();
		session.insert("inter.IProductOperation.insertProduct", product);
		session.commit();
		session.close();
	}

	public void delete_product(int id) {
		SqlSession session = SessionFactoryUtil.getSqlSessionFactory().openSession();
		session.insert("inter.IProductOperation.delete_product", id);
		session.commit();
		session.close();
	}

	@SuppressWarnings("unchecked")
	public List<Product> selectAllProduct() {
		SqlSession session = SessionFactoryUtil.getSqlSessionFactory().openSession();
		List<Product> list = session.selectList("inter.IProductOperation.selectAllProduct");
		session.close();
		return list;
	}

	@Override
	public void update(Product product) {
		SqlSession session = SessionFactoryUtil.getSqlSessionFactory().openSession();
		session.insert("inter.IProductOperation.update", product);
		session.commit();
		session.close();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> selectByName(String name) {
		SqlSession session = SessionFactoryUtil.getSqlSessionFactory().openSession();
		List<Product> product = session.selectList("inter.IProductOperation.selectProductByName", name);
		session.close();
		return product;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> selectBySort(int sort) {
		SqlSession session = SessionFactoryUtil.getSqlSessionFactory().openSession();
		List<Product> product = session.selectList("inter.IProductOperation.selectProductBySort", sort);
		session.close();
		return product;
	}
	
	
}
