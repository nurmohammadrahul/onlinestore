package com.entity;

public class BookDtls {
	private int bookID;
	private String bookName;
	private String author;
	private String price;
	private String status;
	private  String photoName;
	public BookDtls() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookDtls(String bookName, String author, String price, String status, String photoName) {
		super();
		this.bookName = bookName;
		this.author = author;
		this.price = price;
		this.status = status;
		this.photoName = photoName;
	}
	public int getBookID() {
		return bookID;
	}
	public void setBookID(int bookID) {
		this.bookID = bookID;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	@Override
	public String toString() {
		return "BookDtls [bookID=" + bookID + ", bookName=" + bookName + ", author=" + author + ", price=" + price
				+ ", status=" + status + ", photoName=" + photoName + "]";
	}
	

}
