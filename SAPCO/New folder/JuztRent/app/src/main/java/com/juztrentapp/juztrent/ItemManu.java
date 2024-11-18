package com.juztrentapp.juztrent;

public class ItemManu {
    private String itemNames;
    private int img;

    public ItemManu(String itemNames,int img){
        this.itemNames=itemNames;
        this.img=img;
    }

    public String getItemNames() {
        return itemNames;
    }

    public void setItemNames(String itemNames) {
        this.itemNames = itemNames;
    }

    public int getImg() {
        return img;
    }

    public void setImg(int img) {
        this.img = img;
    }
}
