package cn.bdqn.easybuy.dao.orderDetail;

import cn.bdqn.easybuy.entity.OrderDetail;

import java.util.List;

/**
 * Created by Administrator on 2017/12/21.
 */
public interface OrderDetailMapper {
    Integer saveOrderDetail(OrderDetail orderDetail);


    public List<OrderDetail> queryAll(String serialNumber);
    public List<OrderDetail> queryAllUserId(Integer uId);

    public List<OrderDetail> getAll(List<Integer> oIds);
}
