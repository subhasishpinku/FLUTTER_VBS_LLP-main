package com.juztrentapp.juztrent;

public class ItemManus {
    private String itemNames;
    private String itembuttosnames;
    private int img;
    public ItemManus(String itemNames,String itembuttosnames,int img){
        this.itemNames=itemNames;
        this.itembuttosnames=itembuttosnames;
        this.img=img;
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
}
