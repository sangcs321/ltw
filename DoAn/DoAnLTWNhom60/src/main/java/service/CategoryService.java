package service;

import dao.DAOCategory;
import model.Category;

import java.sql.SQLException;
import java.util.ArrayList;

public class CategoryService {
    static CategoryService instance;
    private CategoryService() {
    }
    public static CategoryService getInstance() {
        if (instance == null)
            instance = new CategoryService();
        return instance;
    }
    /*
     load danh sách danh mục sản phẩm
     @return ArrayList<Category>
    */
    public ArrayList<Category> listCategory() {
        return DAOCategory.listCategory();
    }
    public Category getCategoryById(int id) {
        return DAOCategory.getCategoryById(id);
    }
    //Thêm danh mục
    public int insertCategory(Category c){ return  DAOCategory.insertCategory(c);}
    //Xoá danh mục
    public  int delCategory(int id) {
        try {
            return  DAOCategory.delCategory(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    // Chỉnh sửa cập nhật danh mục
    public int updateCategory(Category c) throws SQLException {
        return DAOCategory.updateCategory(c);
    }
}
