package cn.bdqn.easybuy.controller;

import cn.bdqn.easybuy.command.util.Message;
import cn.bdqn.easybuy.entity.CartList;
import cn.bdqn.easybuy.entity.Order;
import cn.bdqn.easybuy.entity.User;
import cn.bdqn.easybuy.service.address.AddressService;
import cn.bdqn.easybuy.service.order.OrderService;
import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2017/12/18.
 */
@Controller
@RequestMapping("order")
public class OrderController {

    @Resource
    private OrderService orderService;

    @Resource
    private AddressService addressService;



    @RequestMapping(value = "saveOrder")
    public String saveOrder(HttpSession session, Integer id,Model model) {
        CartList cartList = (CartList) session.getAttribute("cart");
        User user = (User) session.getAttribute("loginUser");
        Order order= orderService.saveOrder(id, cartList, user);
        session.removeAttribute("cart");

        model.addAttribute("order",order);
        if (null!=order) {
            return "cart/cartList3";
        }
        return "cart/cartList2";
    }

    //生成订单
    @ResponseBody
    @RequestMapping(value = "addOrder", method = RequestMethod.POST,
            produces = {"application/json;charset=utf-8"})
    public String addOrder(Order order) {
        Integer n = orderService.addOrder(order);
        if (n > 0) {
            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.error());
    }

    //通过订单号查询订单信息
    @ResponseBody
    @RequestMapping(value = "queryOrderBySerialNumber", method = RequestMethod.GET,
            produces = {"application/json;charset=utf-8"})
    public String queryOrderBySerialNumber(String serialNumber) {
        Order order = orderService.queryOrderBySerialNumber(serialNumber);
        return JSON.toJSONString(order);
    }

    //通过登录名查询订单信息
    @ResponseBody
    @RequestMapping(value = "queryOrderByLoginName", method = RequestMethod.GET,
            produces = {"application/json;charset=utf-8"})
    public String queryOrderByLoginName(String loginName) {
        List<Order> list = orderService.queryOrderByLoginName(loginName);
        return JSON.toJSONString(list);
    }

    //查询所有的订单
    @RequestMapping("queryAll")
    public String queryAll(Integer pageNum, Integer pageSize, Model model) {
        PageInfo<Order> pageInfo = orderService.queryAll(pageNum, pageSize);
        model.addAttribute("pageInfo", pageInfo);
        return "order/order";
    }

    @RequestMapping("getAll")
    public String getyAll(Model model) {
        List<Order> pageInfo = orderService.queryAll();
        model.addAttribute("plist", pageInfo);
        for (Order order : pageInfo) {
            System.out.println(order);
        }
        return "order/order";
    }


}
