package com.juztrentapp.juztrent;

public class OrderHistoryItem {
    private String itemNames;
    private String itembuttosnames;
    private String amount;
    private String deliverd;
    private int img;
    public OrderHistoryItem(String itemNames,String itembuttosnames,String amount,String deliverd,int img){
        this.itemNames=itemNames;
        this.itembuttosnames=itembuttosnames;
        this.amount=amount;
        this.deliverd=deliverd;
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

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getDeliverd() {
        return deliverd;
    }

    public void setDeliverd(String deliverd) {
        this.deliverd = deliverd;
    }

    public int getImg() {
        return img;
    }

    public void setImg(int img) {
        this.img = img;
    }
}
