package Entity;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Logger;

public class User {
	private String username;
	private String password;
	private String authorities;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		 try {
		        MessageDigest md = MessageDigest.getInstance("MD5");
		        BigInteger bi = new BigInteger(1, md.digest(password.getBytes()));
		        this.password = bi.toString(16);
		    } catch (NoSuchAlgorithmException ex) {
		    }
	}
	public String getAuthorities() {
		return authorities;
	}
	public void setAuthorities(String authorities) {
		this.authorities = authorities;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	private String name;
	private String address;
}
