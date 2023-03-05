package com.learn.mycart.dao;

import com.learn.mycart.entities.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class ProductDao {

    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveProduct(Product product) {
        boolean f = false;

        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        int pId = (int) session.save(product);

        tx.commit();
        session.close();
        f = true;

        return f;
    }

    public List<Product> getAllProducts() {
        Session session = this.factory.openSession();
        Query query = session.createQuery("from Product");
        List<Product> list = query.list();

        session.close();

        return list;
    }

    // PRoducts for given Categories
    public List<Product> getAllProductsById(int cid) {
        Session session = this.factory.openSession();
        Query query = session.createQuery("from Product as p where p.category.categoryId =: id");
        query.setParameter("id", cid);
        List<Product> list = query.list();

        session.close();

        return list;
    }

}
