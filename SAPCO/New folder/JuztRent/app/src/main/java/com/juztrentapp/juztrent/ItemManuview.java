package com.juztrentapp.juztrent;

public class ItemManuview {
    private String itemNames;
    private String itembuttosnames;
    private int img;
    private String price;
    public ItemManuview(String itemNames,String itembuttosnames,int img,String price){
        this.itemNames=itemNames;
        this.itembuttosnames=itembuttosnames;
        this.img=img;
        this.price=price;
    }

    public String getItemNames() {
        return itemNames;
    }

    public void setItemNames(String itemNames) {
        this.itemNames = itemNames;
    }

    public String getItembuttosnames() {
        return itembuttosnames;
    }

    public void setItembuttosnames(String itembuttosnames) {
        this.itembuttosnames = itembuttosnames;
    }

    public int getImg() {
        return img;
    }

    public void setImg(int img) {
        this.img = img;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }
}
