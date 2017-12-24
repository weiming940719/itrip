package cn.bdqn.easybuy.dao.order;

import cn.bdqn.easybuy.entity.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2017/12/18.
 */
public interface OrderMapper {
    Integer addOrder(Order order);

    Order queryOrderBySerialNumber(@Param("serialNumber") String serialNumber);

    List<Order> queryOrderByLoginName(@Param("loginName") String loginName);

    List<Order> queryAll();

    List<Order> queryOrderById(@Param("id") Integer id);

    List<Integer> getAll();
    List<Order> queryUidAll(Integer uId);
    List<Integer> queryUid(Integer uId);


}
