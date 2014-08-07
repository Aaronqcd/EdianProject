package controller;

import inter.UserDAO;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.UserDAOImpl;

import bean.Product;

@Controller
public class AddProductAction {
	private List<Product> list = null;
	static Logger logger = Logger.getLogger(AddProductAction.class.getName());  
	
	@RequestMapping(value = "/upload.do")  
	public String upload(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request, ModelMap model, HttpServletResponse response) {  
	  
		String path = request.getSession().getServletContext().getRealPath("upload");
		//String projectPath = "D:/Users/Administrator/Workspaces/MyEclipse 10/EdianManage/WebRootpage/upload/";
		String fileName = file.getOriginalFilename();  
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		int status = Integer.parseInt(request.getParameter("status"));
		int sort = Integer.parseInt(request.getParameter("sort"));
		Product product = new Product();
		product.setName(name);
		product.setPicture(fileName);
		product.setStatus(status);
		product.setSort(sort);
		product.setType(type);
		UserDAO userDao = new UserDAOImpl();
		File targetFile = new File(path, fileName);  
		if(!targetFile.exists()){  
			targetFile.mkdirs();  
		}  
		try {  
			file.transferTo(targetFile); 
	            
		} catch (Exception e) {  
			e.printStackTrace();  
		} 
		userDao.insertName(product);
	      
		logger.debug("Debug ...");  
		logger.info("Info ...");  
		logger.warn("Warn ...");  
		logger.error("Error ...");    
	        
		model.addAttribute("fileUrl", request.getContextPath()+"/upload/"+fileName);  
		try {
			response.sendRedirect("showAll.do");
		} catch (IOException e) {
			e.printStackTrace();
		}
	        return null;  
	}  
	
	@RequestMapping(value = "/showAll.do")
	public String showAll(HttpServletRequest request, HttpServletResponse response, Model model) {
		UserDAO userDao = new UserDAOImpl();
		String path = request.getSession().getServletContext().getRealPath("upload");
		list = userDao.selectAllProduct();
		model.addAttribute("list", list);
		model.addAttribute("path", path);
		return "../../page/Product/index";
	}

	@RequestMapping(value = "/selectById.do")
	public String selectById(HttpServletRequest request, HttpServletResponse response, Model model) {
		UserDAO userDao = new UserDAOImpl();
		Product product = new Product();
		int id = Integer.parseInt(request.getParameter("id"));
		product = userDao.selectProduct(id);
		model.addAttribute("product", product);
		return "../../page/Product/edit";
	}
	
	@RequestMapping(value = "/selectByName.do")
	public String selectByName(HttpServletRequest request, HttpServletResponse response, Model model) {
		UserDAO userDao = new UserDAOImpl();
		String path = request.getSession().getServletContext().getRealPath("upload");
		String name;
		try {
			name = new String(request.getParameter("name").getBytes("ISO-8859-1"), "utf-8");
			System.out.println(name);
			list = userDao.selectByName(name);
			model.addAttribute("list", list);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("path", path);
		return "../../page/Product/index";
	}
	
	@RequestMapping(value = "/update.do")
	public String update(HttpServletRequest request, HttpServletResponse response, Model model) {
		UserDAO userDao = new UserDAOImpl();
		Product product = new Product();
		String name = request.getParameter("name");
		int sort = Integer.parseInt(request.getParameter("sort"));
		int status = Integer.parseInt(request.getParameter("status"));
		String type = request.getParameter("type");
		int id = Integer.parseInt(request.getParameter("id"));
		product.setName(name);
		product.setId(id);
		product.setSort(sort);
		product.setStatus(status);
		product.setType(type);
		userDao.update(product);
		try {
			response.sendRedirect("showAll.do");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value = "/delete.do")
	public String delete(HttpServletRequest request, HttpServletResponse response, Model model) {
		UserDAO userDao = new UserDAOImpl();
		int id = Integer.parseInt(request.getParameter("id"));
		userDao.delete_product(id);
		try {
			response.sendRedirect("showAll.do");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value = "/checkSort.do")
	public @ResponseBody String checkSort(HttpServletRequest request, HttpServletResponse response, Model model) {
		UserDAO userDao = new UserDAOImpl();
		int sort = 0;
		try{
			sort = Integer.parseInt(request.getParameter("sort"));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		System.out.println(sort);
		list = userDao.selectBySort(sort);
		System.out.println(list.size());
		if (list.size() != 0) {
			return "false";
		}
		/*try {
			response.sendRedirect("showAll.do");
		} catch (IOException e) {
			e.printStackTrace();
		}*/
		return "true";
	}
	
	public List<Product> getList() {
		return list;
	}

	public void setList(List<Product> list) {
		this.list = list;
	}
	
}

