package cn.bdqn.easybuy.service.order;

import cn.bdqn.easybuy.entity.CartList;
import cn.bdqn.easybuy.entity.Order;
import cn.bdqn.easybuy.entity.User;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by Administrator on 2017/12/18.
 */

public interface OrderService {
    Integer addOrder(Order order);

    Order saveOrder(Integer id, CartList cartList, User user);

    Order queryOrderBySerialNumber(String serialNumber);

    List<Order> queryOrderByLoginName(String loginName);

    PageInfo<Order> queryAll(Integer pageNum, Integer pageSize);


    List<Order> queryAll();
    List<Integer> getAll();
    List<Order> queryUidAll(Integer uId);
    List<Integer> queryUid(Integer uId);
}
