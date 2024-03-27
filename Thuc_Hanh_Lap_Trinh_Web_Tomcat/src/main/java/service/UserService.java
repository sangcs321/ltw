package service;

import bean.User;
import dao.UserDAO;
import db.JDBIConnector;

import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class UserService {
    static Map<String,String> data = new HashMap<>();
    static {
        data.put("tquan957@gmail.com","123456");
        data.put("kiwi@gmail.com","010203");
    }
    private  static UserService instance;

    public static  UserService getInstance(){
        if (instance==null) instance = new UserService();
        return instance;
    }
    public User checkLogin(String email, String pass){
        User userByEmail = UserDAO.getUserByEmail(email);
        if (userByEmail==null) return null;
        if (!userByEmail.getEmail().equals(email)||!userByEmail.getPassword().equals(pass)) return null;
        return userByEmail;
    }

    public static void main(String[] args) {
        List<User> users = JDBIConnector.me().withHandle((handle ->{
            return handle.createQuery("select * from users").mapToBean(User.class).collect(Collectors.toList()
            );
        }));
    }
}
