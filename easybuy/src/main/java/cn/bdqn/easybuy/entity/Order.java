package cn.bdqn.easybuy.entity;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/12/18.
 */
public class Order {
    private Integer id;
    private Integer userId;
    private String loginName;
    private String userAddress;
    private Date createTime;
    private Float cost;
    private String serialNumber;
    private User user;
    private List<OrderDetail> orderDetailList;
    private Product product;
    private List<UserAddress> address;

    public List<UserAddress> getAddress() {
        return address;
    }

    public void setAddress(List<UserAddress> address) {
        this.address = address;
    }

    public Order() {
    }

    public Order(Integer userId, String loginName, String userAddress, Float cost) {
        this.userId = userId;
        this.loginName = loginName;
        this.userAddress = userAddress;
        this.cost = cost;
    }

    public Order(Integer userId, String loginName, String userAddress, Float cost, String serialNumber) {
        this.userId = userId;
        this.loginName = loginName;
        this.userAddress = userAddress;
        this.cost = cost;
        this.serialNumber = serialNumber;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<OrderDetail> getOrderDetailList() {
        return orderDetailList;
    }

    public void setOrderDetailList(List<OrderDetail> orderDetailList) {
        this.orderDetailList = orderDetailList;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", userId=" + userId +
                ", loginName='" + loginName + '\'' +
                ", userAddress='" + userAddress + '\'' +
                ", createTime=" + createTime +
                ", cost=" + cost +
                ", serialNumber='" + serialNumber + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Float getCost() {
        return cost;
    }

    public void setCost(Float cost) {
        this.cost = cost;
    }

    public String getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
    }
}
