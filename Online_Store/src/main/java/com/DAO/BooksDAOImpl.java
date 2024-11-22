package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtls;

public class BooksDAOImpl implements BooksDAO{

	private Connection conn;
	
	public BooksDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addBooks(BookDtls b) {
		boolean f=false;
	  try {
		  String sql="insert into book_dtls(bookName,author,price,status,photo)values(?,?,?,?,?)";
		  PreparedStatement ps=conn.prepareStatement(sql);
		  ps.setString(1,b.getBookName());
		  ps.setString(2,b.getAuthor());
		  ps.setString(3,b.getPrice());
		  ps.setString(4,b.getStatus());
		  ps.setString(5,b.getPhotoName());
		  int i =ps.executeUpdate();
		  if(i==1) {
			  f=true;
		  }
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
		return f;
	}

	@Override
	public List<BookDtls> getAllBooks() {
		List<BookDtls>list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql="select * from book_dtls";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new BookDtls();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setStatus(rs.getString(5));
				b.setPhotoName(rs.getString(6));
				list.add(b);
			}
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public BookDtls getBookById(int id) {
		 BookDtls b=null;
		 try {
			 String sql="select * from book_dtls where bookID=?";
			 PreparedStatement ps=conn.prepareStatement(sql);
			 ps.setInt(1, id);
			 ResultSet rs=ps.executeQuery();
			 while(rs.next()) {
				 b=new BookDtls();
					b.setBookID(rs.getInt(1));
					b.setBookName(rs.getString(2));
					b.setAuthor(rs.getString(3));
					b.setPrice(rs.getString(4));
					b.setStatus(rs.getString(5));
					b.setPhotoName(rs.getString(6));

			 }
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		 return b;
		 }

	@Override
	public boolean updateEditBooks(BookDtls b) {
		boolean f=false;
		try {
			String sql="update book_dtls set bookName=?, author=?,price=?,status=? where bookID=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookID());
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return f;
	}

	@Override
	public boolean deleteBooks(int id) {
		boolean f=false;
		try {
			String sql="delete from book_dtls where bookID=?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return f;
	}

	@Override
	public List<BookDtls> getNewBook() {
		 List<BookDtls>list=new ArrayList<BookDtls>();
		 BookDtls b=null;
		 try {
			String sql="select * from book_dtls where status=? order by bookID DESC";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1,"Active");
			 ResultSet rs=ps.executeQuery();
			 int i=1;
			 while(rs.next() && i<=4) {
				 b=new BookDtls();
				 b.setBookID(rs.getInt(1));
					b.setBookName(rs.getString(2));
					b.setAuthor(rs.getString(3));
					b.setPrice(rs.getString(4));
					b.setStatus(rs.getString(5));
					b.setPhotoName(rs.getString(6));
					list.add(b);
					i++;
			 }
			 
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public List<BookDtls> getAllNewBook() {
		 List<BookDtls>list=new ArrayList<BookDtls>();
		 BookDtls b=null;
		 try {
			String sql="select * from book_dtls where status=? order by bookID DESC";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1,"Active");
			 ResultSet rs=ps.executeQuery();
			
			 while(rs.next()) {
				 b=new BookDtls();
				 b.setBookID(rs.getInt(1));
					b.setBookName(rs.getString(2));
					b.setAuthor(rs.getString(3));
					b.setPrice(rs.getString(4));
					b.setStatus(rs.getString(5));
					b.setPhotoName(rs.getString(6));
					list.add(b);
				
			 }
			 
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public List<BookDtls> getBookBySearch(String ch) {
		
			List<BookDtls>list=new ArrayList<BookDtls>();
			BookDtls b=null;
			try {
				String sql="select * from book_dtls where bookName like ? or author like ?";
				 PreparedStatement ps=conn.prepareStatement(sql);
				 ps.setString(1,"%"+ch+"%");
				 ps.setString(2,"%"+ch+"%");
				 ResultSet rs=ps.executeQuery();
				 while(rs.next()) {
					 b=new BookDtls();
						b.setBookID(rs.getInt(1));
						b.setBookName(rs.getString(2));
						b.setAuthor(rs.getString(3));
						b.setPrice(rs.getString(4));
						b.setStatus(rs.getString(5));
						b.setPhotoName(rs.getString(6));
						list.add(b);

				 }
				
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
			return list;
	}
	 
	
	
	

}
