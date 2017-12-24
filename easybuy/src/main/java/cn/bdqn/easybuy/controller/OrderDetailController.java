package cn.bdqn.easybuy.controller;

import cn.bdqn.easybuy.entity.Order;
import cn.bdqn.easybuy.entity.OrderDetail;
import cn.bdqn.easybuy.entity.User;
import cn.bdqn.easybuy.service.order.OrderService;
import cn.bdqn.easybuy.service.orderDetail.OrderDetailService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/12/20.
 */
@Controller
@RequestMapping("detail")
public class OrderDetailController {
    @Resource
    private OrderDetailService orderDetailService;

    @Resource
    private OrderService orderService;

    @RequestMapping("queryAll")
    public String queryAll(Model model) {
        List<Order> olist = orderService.queryAll();
        List<OrderDetail> list = null;
        for (Order order : olist) {
            list = orderDetailService.queryAll(order.getSerialNumber());
        }
        model.addAttribute("olist", olist);
        model.addAttribute("list", list);
        return "order";
    }

    @RequestMapping("queryAllUserId")
    public String queryAllUserId(Integer uId, Model model) {
        List<OrderDetail> list = orderDetailService.queryAllUserId(uId);
        model.addAttribute("list", list);
        return "order";
    }

    @RequestMapping("getAll")
    public String getAll(Model model) {
        List<Order> orderList = orderService.queryAll();
        List<OrderDetail> orderDetailList = orderDetailService.getAll();
        model.addAttribute("orderList", orderList);
        model.addAttribute("orderDetailList", orderDetailList);
        return "order/order";
    }

    @RequestMapping("queryAllUserIds")
    public String queryAllUserIds(Model model, HttpSession session) {
        User user = (User) session.getAttribute("loginUser");
        List<Order> order = orderService.queryUidAll(user.getId());
        List<OrderDetail> orderDetailList = new ArrayList<>();
        try {
            orderDetailList = orderDetailService.queryAllUserId(user.getId());
        } catch (Exception e) {
            orderDetailList = null;
        }
        model.addAttribute("order", order);
        model.addAttribute("detailList", orderDetailList);
        return "order/myorder";
    }
}
