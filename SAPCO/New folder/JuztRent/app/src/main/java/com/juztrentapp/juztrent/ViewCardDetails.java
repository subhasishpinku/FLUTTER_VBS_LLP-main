package com.juztrentapp.juztrent;

public class ViewCardDetails {
    private String itemNames;
    private String itemSNames;
    private String itemAmount;
    private int img;

    public ViewCardDetails(String itemNames,String itemSNames,String itemAmount, int img){
        this.itemNames=itemNames;
        this.itemSNames=itemSNames;
        this.itemAmount=itemAmount;
        this.img=img;
    }

    public String getItemNames() {
        return itemNames;
    }

    public void setItemNames(String itemNames) {
        this.itemNames = itemNames;
    }

    public String getItemSNames() {
        return itemSNames;
    }

    public void setItemSNames(String itemSNames) {
        this.itemSNames = itemSNames;
    }

    public String getItemAmount() {
        return itemAmount;
    }

    public void setItemAmount(String itemAmount) {
        this.itemAmount = itemAmount;
    }

    public int getImg() {
        return img;
    }

    public void setImg(int img) {
        this.img = img;
    }
}
