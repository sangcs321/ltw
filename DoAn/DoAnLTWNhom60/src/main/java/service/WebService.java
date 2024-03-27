package service;
import dao.DAOCategory;
import dao.DaoWeb;
import model.Category;
import model.InforWebsite;

import java.sql.SQLException;
import java.util.ArrayList;
public class WebService {
    static WebService instance;
    private WebService() {
    }
    public static WebService getInstance() {
        if (instance == null)
            instance = new WebService();
        return instance;
    }
    public int updatePolicy(InforWebsite i) throws SQLException {
        return DaoWeb.updatePolicy(i);
    }
    public int updateContact(InforWebsite i) throws SQLException {
        return DaoWeb.updateContact(i);
    }
    public InforWebsite selectByid (int id) throws SQLException {
        return DaoWeb.selectByid(id);
    }

}
