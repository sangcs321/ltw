package model;

public class InforWebsite {
    private int id;
    private String address;
    private String email;
    private String phoneNumber;
    private int guarantee;
    private int exchange;

    public InforWebsite(int id, String address, String email, String phoneNumber, int guarantee, int exchange) {
        this.id = id;
        this.address = address;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.guarantee = guarantee;
        this.exchange = exchange;
    }
    public InforWebsite(int id, int guarantee, int exchange) {
        this.id = id;
        this.guarantee = guarantee;
        this.exchange = exchange;
    }
    public InforWebsite(int id, String address, String email, String phoneNumber) {
        this.id = id;
        this.address = address;
        this.email = email;
        this.phoneNumber = phoneNumber;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public int getGuarantee() {
        return guarantee;
    }

    public void setGuarantee(int guarantee) {
        this.guarantee = guarantee;
    }

    public int getExchange() {
        return exchange;
    }

    public void setExchange(int exchange) {
        this.exchange = exchange;
    }

    @Override
    public String toString() {
        return "InforWebsite{" +
                "id=" + id +
                ", address='" + address + '\'' +
                ", email='" + email + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", guarantee=" + guarantee +
                ", exchange=" + exchange +
                '}';
    }
}

