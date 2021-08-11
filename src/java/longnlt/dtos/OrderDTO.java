/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longnlt.dtos;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author redra
 */
public class OrderDTO implements Serializable {
    private String id, username, status;
    private float total;
    private Date dateOfCreate;

    public OrderDTO() {
    }

    public OrderDTO(String id, String username, String status, float total, Date dateOfCreate) {
        this.id = id;
        this.username = username;
        this.status = status;
        this.total = total;
        this.dateOfCreate = dateOfCreate;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public Date getDateOfCreate() {
        return dateOfCreate;
    }

    public void setDateOfCreate(Date dateOfCreate) {
        this.dateOfCreate = dateOfCreate;
    }
    
}
