package ptithcm.Entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Admin")
public class Admin {
	@Id
	@GeneratedValue
	public Integer id;
	public String name;
	public String email;
	public String password;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	public Date dayCreate;
	
	@OneToMany(mappedBy = "admin",fetch=FetchType.EAGER)
	public Collection<Bill> bills;
	@OneToMany(mappedBy = "admin",fetch=FetchType.EAGER)
	public Collection<Blog> blogs;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getDayCreate() {
		return dayCreate;
	}
	public void setDayCreate(Date dayCreate) {
		this.dayCreate = dayCreate;
	}
	public Collection<Bill> getBills() {
		return bills;
	}
	public void setBills(Collection<Bill> bills) {
		this.bills = bills;
	}
	public Collection<Blog> getBlogs() {
		return blogs;
	}
	public void setBlogs(Collection<Blog> blogs) {
		this.blogs = blogs;
	}
	
	
}
