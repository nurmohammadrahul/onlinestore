package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookOrder;

public class OrderDAOImpl implements OrderDAO{
	private Connection conn;

	public OrderDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean saveOrder(List<BookOrder> blist) {
		 boolean f=false;
		 try {
			 String sql="insert into book_order(order_id,username,useremail,address,phon,bookname,author,price,payment)values(?,?,?,?,?,?,?,?,?)";
			 conn.setAutoCommit(false);	
			 PreparedStatement ps=conn.prepareStatement(sql);
				for(BookOrder b:blist) {
					ps.setString(1, b.getOrderId());
					ps.setString(2, b.getName());
					ps.setString(3, b.getEmail());
					ps.setString(4, b.getFullAdd());
					ps.setString(5, b.getPhno());
					ps.setString(6, b.getBookName());
					ps.setString(7, b.getAuthor());
					ps.setString(8, b.getPrice());
					ps.setString(9, b.getPaymentType());
					ps.addBatch();
				}
				int[] count=ps.executeBatch();
				conn.commit();
				f=true;
				conn.setAutoCommit(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		 return f;
	}

	@Override
	public List<BookOrder> getBook(String email) {
		List<BookOrder>list=new ArrayList<BookOrder>();
		BookOrder o=null;
		 try {
			 String sql="select * from book_order where useremail=?";
			 PreparedStatement ps=conn.prepareStatement(sql);
			 ps.setString(1, email);
			 ResultSet rsResultSet=ps.executeQuery();
			 while(rsResultSet.next()) {
				 o=new BookOrder();
				 o.setId(rsResultSet.getInt(1));
				 o.setOrderId(rsResultSet.getString(2));
				 o.setName(rsResultSet.getString(3));
				 o.setEmail(rsResultSet.getString(4));
				 o.setFullAdd(rsResultSet.getString(5));
				 o.setPhno(rsResultSet.getString(6));
				 o.setBookName(rsResultSet.getString(7));
				 o.setAuthor(rsResultSet.getString(8));
				 o.setPrice(rsResultSet.getString(9));
				 o.setPaymentType(rsResultSet.getString(10));
				 list.add(o);
			 }
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		 return list;
	}

	@Override
	public List<BookOrder> getBook() {
		List<BookOrder>list=new ArrayList<BookOrder>();
		BookOrder o=null;
		 try {
			 String sql="select * from book_order";
			 PreparedStatement ps=conn.prepareStatement(sql);
			 ResultSet rsResultSet=ps.executeQuery();
			 while(rsResultSet.next()) {
				 o=new BookOrder();
				 o.setId(rsResultSet.getInt(1));
				 o.setOrderId(rsResultSet.getString(2));
				 o.setName(rsResultSet.getString(3));
				 o.setEmail(rsResultSet.getString(4));
				 o.setFullAdd(rsResultSet.getString(5));
				 o.setPhno(rsResultSet.getString(6));
				 o.setBookName(rsResultSet.getString(7));
				 o.setAuthor(rsResultSet.getString(8));
				 o.setPrice(rsResultSet.getString(9));
				 o.setPaymentType(rsResultSet.getString(10));
				 list.add(o);
			 }
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		 return list;
	}
	
	
	
	

}
