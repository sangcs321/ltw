package model;

public class Supplier {
    private int idSup;
    private String nameSup;
    private String phoneNumber;
    private String email;
    private int idCate;
    private String address;

    public Supplier( String nameSup, String phoneNumber, String email, int idCate, String address) {

        this.nameSup = nameSup;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.idCate = idCate;
        this.address = address;
    }


    public Supplier(int idSup, String nameSup, String phoneNumber, String email, int idCate, String address) {
        this.idSup = idSup;
        this.nameSup = nameSup;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.idCate = idCate;
        this.address = address;
    }

    public String getNameSup() {
        return nameSup;
    }

    public void setNameSup(String nameSup) {
        this.nameSup = nameSup;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getIdCate() {
        return idCate;
    }

    public void setIdCate(int idCate) {
        this.idCate = idCate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getIdSup() {
        return idSup;
    }

    public void setId(int idSup) {
        this.idSup = idSup;
    }
    public String typeCate(int idCate){
        if(idCate==3)return "Ghế văn phòng";
        else if(idCate==4) return "Ghế thư giãn";
        else if(idCate==1) return "Ghế trang trí";
        else if(idCate==2) return "Ghế gaming";
        return null;
    }

    @Override
    public String toString() {
        return "Supplier{" +
                "idSup=" + idSup +
                ", nameSup='" + nameSup + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", email='" + email + '\'' +
                ", idCate=" + idCate +
                ", address='" + address + '\'' +
                '}';
    }
}
