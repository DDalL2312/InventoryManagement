/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;

public class ProductDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Product> getProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select p.product_id, c.category_name, p.product_name, p.product_price, p.product_raw_price, p.quantity, p.img, p.receipts \n"
                + "from Products p inner join Category c on p.category_id = c.category_id";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                //Category category, int id, String name, double price, double rawPrice, int quantity, String img, String receipt
                Category c = new Category(rs.getString(2));
                list.add(new Product(c, rs.getInt(1), rs.getString(3), rs.getDouble(4), rs.getDouble(5), rs.getInt(6), rs.getString(7), rs.getString(8)));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Category> getCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Category";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Product> getFilter(String id) {
        List<Product> list = new ArrayList<>();
        String sql = "select p.product_id, c.category_name, p.product_name, p.product_price, p.product_raw_price, p.quantity, p.img, p.receipts \n"
                + "from Products p inner join Category c on p.category_id = c.category_id where p.category_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                //Category category, int id, String name, double price, double rawPrice, int quantity, String img, String receipt
                Category c = new Category(rs.getString(2));
                list.add(new Product(c, rs.getInt(1), rs.getString(3), rs.getDouble(4), rs.getDouble(5), rs.getInt(6), rs.getString(7), rs.getString(8)));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Product> getListByPage(List<Product> list,
            int start, int end) {
        ArrayList<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
    
    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        List<Product> list = dao.getProduct();
        for (Product o : list) {
            System.out.println(o.getCategory().getName());
        }
    } 
}
