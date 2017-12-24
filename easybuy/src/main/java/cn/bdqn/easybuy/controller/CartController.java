package cn.bdqn.easybuy.controller;

import cn.bdqn.easybuy.entity.Cart;
import cn.bdqn.easybuy.entity.CartList;
import cn.bdqn.easybuy.entity.User;
import cn.bdqn.easybuy.entity.UserAddress;
import cn.bdqn.easybuy.service.address.AddressService;
import cn.bdqn.easybuy.service.cart.CartService;
import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2017/12/20.
 */
@Controller
@RequestMapping("cart")
public class CartController {
    @Resource
    private CartService cartService;
    @Autowired
    private AddressService addressService;

    @ResponseBody
    @RequestMapping(value = "saveCart", method = RequestMethod.POST, produces = {"application/json;charset=utf-8"})
    public String saveCart(HttpSession session, Integer id, Integer quantity) {
        CartList cart = getCartFromSession(session);
        String message = cartService.saveProductToCart(id, quantity, cart);
        cart = cartService.flushCart(cart);
        return JSON.toJSONString(message);
    }

    @ResponseBody
    @RequestMapping(value = "deleteCartById", method = RequestMethod.POST, produces = {"application/json;charset=utf-8"})
    public String deleteCartById(Integer id, HttpSession session) {
        CartList cartList = getCartFromSession(session);
        Integer i = cartService.deleteProductFromCart(id, cartList);
        cartService.flushCart(cartList);
        return JSON.toJSONString(i);
    }

    @ResponseBody
    @RequestMapping(value = "updateCart", method = RequestMethod.POST, produces = {"application/json;charset=utf-8"})
    public String updateCart(HttpSession session, Integer id, Integer quantity) {
        System.out.println("id============>"+id);
        System.out.println("quantity=========>"+quantity);
        CartList cart = getCartFromSession(session);
        Cart cart1 = cartService.updateCart(id, quantity, cart);
        cartService.flushCart(cart);
        if (cart1 != null) {
            return JSON.toJSONString(cart);
        }
        return JSON.toJSONString("库存不足");
    }


    @ResponseBody
    @RequestMapping(value = "deleteList", method = RequestMethod.POST, produces = {"application/json;charset=utf-8"})
    public String deleteList(String id, HttpSession session) {
        String[] ids = id.split(",");

        CartList cart = getCartFromSession(session);
        for (String i : ids) {
            Integer s = cartService.deleteProductFromCart(Integer.parseInt(i), cart);
        }
        cartService.flushCart(cart);
        return JSON.toJSONString("移除成功！");
    }


    @RequestMapping("queryAddress")
    public String queryAddress(Model model,HttpSession session) {
        CartList cartList=getCartFromSession(session);
        User user= (User) session.getAttribute("loginUser");
        cartService.flushCart(cartList);
        List<UserAddress> addressList = addressService.queryUserAddress(user.getId());
        model.addAttribute("addressList", addressList);
        return "cart/cartList2";
    }


    @RequestMapping("detail")
    public String detail(HttpSession session) {
        CartList cartList = getCartFromSession(session);
        return "cart/cartList";
    }


    public CartList getCartFromSession(HttpSession session) {
        CartList cartList = (CartList) session.getAttribute("cart");
        if (cartList == null) {
            cartList = new CartList();
            session.setAttribute("cart", cartList);
        }
        return cartList;
    }
}
