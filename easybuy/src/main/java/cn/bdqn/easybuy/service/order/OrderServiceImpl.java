package cn.bdqn.easybuy.service.order;

import cn.bdqn.easybuy.command.util.SerialNumberUtil;
import cn.bdqn.easybuy.dao.address.AddressMapper;
import cn.bdqn.easybuy.dao.cart.CartMapper;
import cn.bdqn.easybuy.dao.order.OrderMapper;
import cn.bdqn.easybuy.dao.orderDetail.OrderDetailMapper;
import cn.bdqn.easybuy.dao.prodcut.ProductMapper;
import cn.bdqn.easybuy.entity.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/12/18.
 */
@Service
public class OrderServiceImpl implements OrderService {
    @Resource
    private OrderMapper orderMapper;

    @Resource
    private ProductMapper productMapper;

    @Resource
    private AddressMapper addressMapper;

    @Resource
    private CartMapper cartMapper;

    @Resource
    private OrderDetailMapper orderDetailMapper;

    @Override
    public Integer addOrder(Order order) {
        order.setSerialNumber(SerialNumberUtil.getOrderIdByUUId());
        return orderMapper.addOrder(order);
    }

    @Override
    public Order saveOrder(Integer id, CartList cartList, User user) {
        UserAddress address1 = addressMapper.queryAddressById(id);
        Order order = new Order(user.getId(), user.getLoginName(), address1.getAddress(), new Float(cartList.getSum()), SerialNumberUtil.getOrderIdByUUId());
        Integer i = orderMapper.addOrder(order);
        Integer orderId = order.getId();
        for (Cart cart : cartList.getCarts()) {
            cart.getProduct().getPrice();
            Float aFloat = cart.getQuantity() * cart.getProduct().getPrice();
            Integer a = orderDetailMapper.saveOrderDetail(new OrderDetail(orderId, cart.getProduct().getId(), cart.getQuantity(), aFloat));
            productMapper.updateProduct(cart.getProduct().getId(),cart.getProduct().getStock()-cart.getQuantity());
        }
        return orderMapper.queryOrderById(orderId).get(0);
    }

    @Override
    public Order queryOrderBySerialNumber(String serialNumber) {
        return orderMapper.queryOrderBySerialNumber(serialNumber);
    }

    @Override
    public List<Order> queryOrderByLoginName(String loginName) {
        return orderMapper.queryOrderByLoginName(loginName);
    }

    @Override
    public PageInfo<Order> queryAll(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Order> list = orderMapper.queryAll();
        PageInfo<Order> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public List<Order> queryAll() {
        return orderMapper.queryAll();
    }

    @Override
    public List<Integer> getAll() {
        return orderMapper.getAll();
    }

    @Override
    public List<Order> queryUidAll(Integer uId) {
        return orderMapper.queryUidAll(uId);
    }

    @Override
    public List<Integer> queryUid(Integer uId) {

        return orderMapper.queryUid(uId);
    }
}
