package com.juztrentapp.juztrent;
public class Notificationsetget {
    private String notiname;
    private String notidate;
    private int img;
    public Notificationsetget(String notiname,String notidate,int img){
         this.notiname=notiname;
         this.notidate=notidate;
         this.img=img;
    }
    public String getNotiname() {
        return notiname;
    }
    public void setNotiname(String notiname) {
        this.notiname = notiname;
    }

    public String getNotidate() {
        return notidate;
    }

    public void setNotidate(String notidate) {
        this.notidate = notidate;
    }

    public int getImg() {
        return img;
    }

    public void setImg(int img) {
        this.img = img;
    }
}
