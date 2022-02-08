package ptithcm.Entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Bill")
public class Bill {
	@Id
	@GeneratedValue
	public Integer id;
	public String customer;
	public String phone;
	public String email;
	public String address;
	public Boolean status;
	public Long total;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	public Date dayCreate;
	
	@ManyToOne
	@JoinColumn(name = "userId")
	public Users user;
	@ManyToOne
	@JoinColumn(name = "adId")
	public Admin admin;
	
	@OneToMany(mappedBy = "bill",fetch=FetchType.EAGER)
	public Collection<BillDetail> billDetails;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public Long getTotal() {
		return total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}

	public Date getDayCreate() {
		return dayCreate;
	}

	public void setDayCreate(Date dayCreate) {
		this.dayCreate = dayCreate;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public Collection<BillDetail> getBillDetails() {
		return billDetails;
	}

	public void setBillDetails(Collection<BillDetail> billDetails) {
		this.billDetails = billDetails;
	}
	
	
}
