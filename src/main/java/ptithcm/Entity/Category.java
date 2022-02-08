package ptithcm.Entity;

import javax.persistence.Table;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
@Table(name = "Category")
public class Category {
	@Id
	@GeneratedValue
	public Integer id;
	public String name;
	@OneToMany(mappedBy = "category",fetch =FetchType.EAGER)
	public Collection<Product> products;
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
	public Collection<Product> getProducts() {
		return products;
	}
	public void setProducts(Collection<Product> products) {
		this.products = products;
	}
	
}
