package model;

import java.sql.Date;
import java.time.LocalDateTime;

public class VerifyAccount {
    private int id;
    private int idAccount;
    private int verifyCode;
    private LocalDateTime timeCode;
    private boolean stateVerify;

    public VerifyAccount(int id, int idAccount, int verifyCode, LocalDateTime timeCode, boolean stateVerify) {
        this.id = id;
        this.idAccount = idAccount;
        this.verifyCode = verifyCode;
        this.timeCode = timeCode;
        this.stateVerify = stateVerify;
    }
    public VerifyAccount(int idAccount, int verifyCode, LocalDateTime timeCode, boolean stateVerify) {
        this.idAccount = idAccount;
        this.verifyCode = verifyCode;
        this.timeCode = timeCode;
        this.stateVerify = stateVerify;
    }
    public VerifyAccount(boolean stateVerify) {
        this.stateVerify = stateVerify;
    }

    public VerifyAccount() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdAccount() {
        return idAccount;
    }

    public void setIdAccount(int idAccount) {
        this.idAccount = idAccount;
    }

    public int getVerifyCode() {
        return verifyCode;
    }

    public void setVerifyCode(int verifyCode) {
        this.verifyCode = verifyCode;
    }

    public LocalDateTime getTimeCode() {
        return timeCode;
    }

    public void setTimeCode(LocalDateTime timeCode) {
        this.timeCode = timeCode;
    }

    public boolean isStateVerify() {
        return stateVerify;
    }

    public void setStateVerify(boolean stateVerify) {
        this.stateVerify = stateVerify;
    }

    @Override
    public String toString() {
        return "VerifyAccount{" +
                "id=" + id +
                ", idAccount=" + idAccount +
                ", verifyCode=" + verifyCode +
                ", timeCode=" + timeCode +
                ", stateVerify=" + stateVerify +
                '}';
    }
}
