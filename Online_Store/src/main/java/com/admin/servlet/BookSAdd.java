package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BooksDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;

@WebServlet("/add_books")
@MultipartConfig
public class BookSAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bookName=req.getParameter("bname");
			String author=req.getParameter("author");
			String price=req.getParameter("price");
			String status=req.getParameter("bstatus");
			 Part part=req.getPart("bimg");
			 String fileName=part.getSubmittedFileName();
			 
			 BookDtls b=new BookDtls(bookName,author,price,status,fileName);
			 BooksDAOImpl dao=new BooksDAOImpl(DBConnect.getConn());
			
			 boolean f=dao.addBooks(b);
			 HttpSession session=req.getSession();
			 if(f) {
				 String path= getServletContext().getRealPath("")+"books";
				 File file=new File(path);
				 part.write(path+File.separator+ fileName);
				 
				 session.setAttribute("succMsg", "Books add successfully");
				 resp.sendRedirect("admin/addbooks.jsp");
			 }
			 else {
				 session.setAttribute("failMsg", "Something wrong on server");
				 resp.sendRedirect("admin/addbooks.jsp");
			 }
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
