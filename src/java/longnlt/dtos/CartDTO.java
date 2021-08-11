/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longnlt.dtos;

import java.io.Serializable;
import java.util.HashMap;

/**
 *
 * @author redra
 */
public class CartDTO implements Serializable {
    private HashMap<String, ProductDTO> cart;
    private String customerName;

    public CartDTO() {
        this.cart = new HashMap<>();
    }
    
    public CartDTO (String customerName) {
        this.customerName = customerName;
        this.cart = new HashMap<>();
    }
    
    public void addToCart (ProductDTO dto) throws Exception {
        if(this.cart.containsKey(dto.getId())){
            int newQuantity = this.cart.get(dto.getId()).getQuantity() + 1;
            this.cart.get(dto.getId()).setQuantity(newQuantity);
        } else {
            this.cart.put(dto.getId(), dto);
        }
    }
    
    public void remove (String id) throws  Exception {
        if(this.cart.containsKey(id)){
            this.cart.remove(id);
        }
    }
    
    public float getTotal () throws Exception {
        float result = 0;
        for(ProductDTO dto : this.cart.values()){
            result += dto.getQuantity() * dto.getPrice();
        }
        return result = 0;
    }
    
    public void updateCart (String id, int quantity) throws Exception {
        if(this.cart.containsKey(id)){
            this.cart.get(id).setQuantity(quantity);
        }
    }

    public HashMap<String, ProductDTO> getCart() {
        return cart;
    }

    public void setCart(HashMap<String, ProductDTO> cart) {
        this.cart = cart;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
    
}
