package cn.bdqn.easybuy.entity;

import java.util.List;

/**
 * Created by Administrator on 2017/12/18.
 */
public class ProductCategory {
    private int id;
    private String name;
    private int parentId;
    private int type;
    private String iconClass;
    private List<ProductCategory> productCategories;
    private List<Product> product;


    private  String  parentName;

    public List<Product> getProduct() {
        return product;
    }

    public void setProduct(List<Product> product) {
        this.product = product;
    }


    @Override
    public String toString() {
        return "ProductCategory{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", parentId=" + parentId +
                ", type=" + type +
                ", iconClass='" + iconClass + '\'' +
                ", productCategories=" + productCategories +
                ", product=" + product +
                ", parentName='" + parentName + '\'' +
                '}';
    }

    public List<ProductCategory> getProductCategories() {
        return productCategories;
    }

    public void setProductCategories(List<ProductCategory> productCategories) {
        this.productCategories = productCategories;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getIconClass() {
        return iconClass;
    }

    public void setIconClass(String iconClass) {
        this.iconClass = iconClass;
    }
}
