package com.user.sevlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.OrderDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.BookOrder;
import com.entity.Cart;


@WebServlet("/order")

public class OrderServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 try {
			 HttpSession session=req.getSession();
			 int id=Integer.parseInt(req.getParameter("id"));
			 String name=req.getParameter("name");
			 String email=req.getParameter("email");
			 String phn=req.getParameter("phn");
			 String address=req.getParameter("address");
			 String city=req.getParameter("city");
			 String zip=req.getParameter("zip");
			 String paymentType=req.getParameter("payment");
			 
			 
			 String fullAddress=address+","+city+","+zip;
			 
			 
			 CartDAOImpl dao=new CartDAOImpl(DBConnect.getConn());
			 List<Cart>blist=dao.getBookByUser(id);
			 OrderDAOImpl dao2=new OrderDAOImpl(DBConnect.getConn());
			 
			 BookOrder order=null;
			 ArrayList<BookOrder>orderList=new ArrayList<BookOrder>();
			 Random r=new Random();
			 for(Cart c:blist) {
				order= new BookOrder();
				order.setOrderId("BOOK-ORD-00"+r.nextInt(1000));
				order.setName(name);
				order.setEmail(email);
				order.setPhno(phn);
				order.setFullAdd(fullAddress);
				order.setBookName(c.getBookName());
				order.setAuthor(c.getAuthor());
				order.setPrice(c.getPrice()+"");
				order.setPaymentType(paymentType);
				orderList.add(order);
				
			 }
			 
			 
			 if("select".equals(paymentType)) {
				 session.setAttribute("succMsg", "Choose Payment Method");
				 resp.sendRedirect("cart.jsp");
			 }
			 else {
				boolean f= dao2.saveOrder(orderList);
				if(f) {
					session.setAttribute("succMsg", "Order Placed Successfully");
					 resp.sendRedirect("index.jsp");
					System.out.println("Order Success");
				}
				else {
					System.out.println("Order");
				}
				 
			 }
			 
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
	

}
