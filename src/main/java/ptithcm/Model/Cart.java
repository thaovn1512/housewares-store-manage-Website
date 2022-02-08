package ptithcm.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ptithcm.Entity.BillDetail;
import ptithcm.Entity.Product;

public class Cart {	
private Product product;
private int quantity;

public Cart() {
}

public Cart(Product product, int quantity) {
    this.product = product;
    this.quantity = quantity;
}

public Product getProduct() {
    return product;
}

public void setProduct(Product product) {
    this.product = product;
}

public int getQuantity() {
    return quantity;
}

public void setQuantity(int quantity) {
    this.quantity = quantity;
}

}
