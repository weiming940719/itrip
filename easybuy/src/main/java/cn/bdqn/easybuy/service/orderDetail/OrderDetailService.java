package cn.bdqn.easybuy.service.orderDetail;

import cn.bdqn.easybuy.entity.OrderDetail;

import java.util.List;

/**
 * Created by Administrator on 2017/12/19.
 */
public interface OrderDetailService {
    public List<OrderDetail> queryAll(String serialNumber);


    public List<OrderDetail> queryAllUserId(Integer uId);
    public List<OrderDetail> getAll();
}
