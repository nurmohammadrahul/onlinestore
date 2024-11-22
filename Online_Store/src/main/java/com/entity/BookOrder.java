package com.entity;

public class BookOrder {
	private int id;
	private String orderId;
	private String name;
	private String email;
	private String phno;
	private String fullAdd;
	
	private String bookName;
	private String author;
	private String price;
	
	private String paymentType;
	public BookOrder() {
		super();
		// TODO Auto-generated constructor stub
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

	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhno() {
		return phno;
	}
	public void setPhno(String phno) {
		this.phno = phno;
	}
	public String getFullAdd() {
		return fullAdd;
	}
	public void setFullAdd(String fullAdd) {
		this.fullAdd = fullAdd;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	@Override
	public String toString() {
		return "BookOrder [id=" + id + ", orderId=" + orderId + ", name=" + name + ", email=" + email + ", phno=" + phno
				+ ", fullAdd=" + fullAdd + ", bookName=" + bookName + ", author=" + author + ", price=" + price
				+ ", paymentType=" + paymentType + "]";
	}
	
	
}
