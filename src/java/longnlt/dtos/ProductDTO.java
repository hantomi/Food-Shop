/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longnlt.dtos;

import java.io.Serializable;

/**
 *
 * @author redra
 */
public class ProductDTO implements Serializable {
    private String id, name, desc, size, shipping, delivery, deliveryTime, cateID, img;
    private int stock, quantity;
    private float price;

    public ProductDTO(String id, String name, String desc, String size, String shipping, String delivery, String deliveryTime, String cateID, String img, int stock,int quantity , float price) {
        this.id = id;
        this.name = name;
        this.desc = desc;
        this.size = size;
        this.shipping = shipping;
        this.delivery = delivery;
        this.deliveryTime = deliveryTime;
        this.cateID = cateID;
        this.img = img;
        this.stock = stock;
        this.quantity = quantity;
        this.price = price;
    }

    public ProductDTO(String id, String name, String cateID, String img) {
        this.id = id;
        this.name = name;
        this.cateID = cateID;
        this.img = img;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getShipping() {
        return shipping;
    }

    public void setShipping(String shipping) {
        this.shipping = shipping;
    }

    public String getDelivery() {
        return delivery;
    }

    public void setDelivery(String delivery) {
        this.delivery = delivery;
    }

    public String getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(String deliveryTime) {
        this.deliveryTime = deliveryTime;
    }

    public String getCateID() {
        return cateID;
    }

    public void setCateID(String cateID) {
        this.cateID = cateID;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
    
}
