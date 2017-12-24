package cn.bdqn.easybuy.entity;

/**
 * Created by Administrator on 2017/12/20.
 */
public class Cart {
    private Product product;
    private Integer quantity;
    private double cost;

    public Cart() {
    }

    public Cart(Product product, Integer quantity) {
        this.product = product;
        this.quantity = quantity;
        this.cost = product.getPrice() * quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
        this.cost = quantity * product.getPrice();
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {

        this.cost = cost;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "product=" + product +
                ", quantity=" + quantity +
                ", cost=" + cost +
                '}';
    }
}
