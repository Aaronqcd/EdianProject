package test;

import inter.IProductOperation;
import inter.UserDAO;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.SessionFactoryUtil;

import dao.UserDAOImpl;

import bean.Product;

public class Test {

	public static void main(String[] args) throws IOException {
		SqlSession session = SessionFactoryUtil.getSqlSessionFactory().openSession();
		System.out.println(session);
		try {
			IProductOperation productOperation = session.getMapper(IProductOperation.class);
			Product product = productOperation.selectProduct(1);
			System.out.println(product);
			Product insertUser = new Product();
			insertUser.setName("aa");
			insertUser.setPicture("123");
			productOperation.insertProduct(insertUser);
			
			UserDAO userDao = new UserDAOImpl();
			Product user1 = userDao.selectProduct(1);
			
			System.out.println("user1: " + user1);
			productOperation.delete_product(7);
			session.commit();
			List<Product> list = userDao.selectAllProduct();
			for (Product user2 : list) {
				System.out.println("id: " + user2.getId() + ", username: " + user2.getName() + ", picture: " + user2.getPicture());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

}
