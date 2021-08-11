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
public class CateDTO implements Serializable {
    private String cateID, name, desc;

    public CateDTO() {
    }

    public CateDTO(String cateID, String name, String desc) {
        this.cateID = cateID;
        this.name = name;
        this.desc = desc;
    }

    public String getCateID() {
        return cateID;
    }

    public void setCateID(String cateID) {
        this.cateID = cateID;
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
    
}
