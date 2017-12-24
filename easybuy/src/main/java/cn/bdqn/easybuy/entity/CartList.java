package cn.bdqn.easybuy.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/12/20.
 */
public class CartList {
    private List<Cart> carts;
    private double sum;

    public CartList() {
        this.setCarts(new ArrayList<Cart>());
        this.sum=0;
    }

    public List<Cart> getCarts() {
        return carts;
    }

    public void setCarts(List<Cart> carts) {
        this.carts = carts;
    }

    public double getSum() {
        return sum;
    }

    public void setSum(double sum) {
        this.sum = sum;
    }

    @Override
    public String toString() {
        return "CartList{" +
                "carts=" + carts +
                ", sum=" + sum +
                '}';
    }
}
