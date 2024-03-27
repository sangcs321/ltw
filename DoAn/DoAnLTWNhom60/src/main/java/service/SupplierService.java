package service;

import dao.DAOSupplier;
import model.Supplier;

import java.util.ArrayList;

public class SupplierService {
    static SupplierService instance;

    private SupplierService() {
    }

    public static SupplierService getInstance() {
        if (instance == null)
            instance = new SupplierService();
        return instance;
    }
    public  int insertSupplier(Supplier supplier) {
        return DAOSupplier.insertSupplier(supplier);
    }
    public  int delSupplier(int idSupplier) {
        return DAOSupplier.delSupplier(idSupplier);
    }
    public  ArrayList<Supplier> listAllSupplier() {
        return DAOSupplier.listAllSupplier();
    }
    public Supplier selectSupById(int idSup){
        return DAOSupplier.selectSupById(idSup);
    }
}
