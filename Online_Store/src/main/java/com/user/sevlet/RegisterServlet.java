package com.user.sevlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name=req.getParameter("name");
			String email=req.getParameter("email");
			String phno=req.getParameter("phn");
			String password=req.getParameter("password");
			String check=req.getParameter("check");
			
			//System.out.println(name+" "+email+" "+phno+" "+password+" "+check);
			User us =new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);
			HttpSession session =req.getSession();
			if(check!=null) {
			
			UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
			boolean f2=dao.checkUser(email);
			if(f2) {
				boolean f =dao.userRegister(us);
				
				if(f) {
					//System.out.println("User Register Success");
					session.setAttribute("succmsg","Registration successfully");
					resp.sendRedirect("register.jsp");
				}else {
					//System.out.println("Something Wrong");
					session.setAttribute("failmsg","Something Wrong");
					resp.sendRedirect("register.jsp");
				}
			}
			else {
				session.setAttribute("failmsg","User Already Registered");
				resp.sendRedirect("register.jsp");
			}
			}
			else {
				//System.out.println("Please Agree");
				session.setAttribute("failmsg","Please Agree terms & Conditions");
				resp.sendRedirect("register.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}

















