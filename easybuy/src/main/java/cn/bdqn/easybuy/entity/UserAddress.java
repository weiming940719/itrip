package cn.bdqn.easybuy.entity;

import java.util.Date;

/**
 * Created by Administrator on 2017/12/18.
 */
public class UserAddress {
    private Integer id;
    private Integer userId;
    private String address;
    private Date createTime;
    private Integer isDefault;
    private String remark;
    private String nextMobile;
    private String nextName;

    public UserAddress() {
    }

    public String getNextMobile() {
        return nextMobile;
    }

    public UserAddress(Integer userId, String address, String remark, String nextMobile, String nextName) {
        this.userId = userId;
        this.address = address;
        this.remark = remark;
        this.nextMobile = nextMobile;
        this.nextName = nextName;
    }

    public void setNextMobile(String nextMobile) {
        this.nextMobile = nextMobile;
    }

    public String getNextName() {
        return nextName;
    }

    public void setNextName(String nextName) {
        this.nextName = nextName;
    }

    @Override
    public String toString() {
        return "UserAddress{" +
                "id=" + id +
                ", userId=" + userId +
                ", address='" + address + '\'' +
                ", createTime=" + createTime +
                ", isDefault=" + isDefault +
                ", remark='" + remark + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public int getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(int isDefault) {
        this.isDefault = isDefault;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
