package cn.bdqn.easybuy.controller;

import cn.bdqn.easybuy.entity.User;
import cn.bdqn.easybuy.entity.UserAddress;
import cn.bdqn.easybuy.service.address.AddressService;
import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2017/12/20 0020.
 */
@Controller
@RequestMapping("address")
public class AddressController {
    @Autowired
    private AddressService addressService;

    @RequestMapping("queryAddress")
    public String queryAddress(Integer userId, Model model) {
        List<UserAddress> addressList = addressService.queryUserAddress(2);
        model.addAttribute("addressList", addressList);
        return "cart/cartList2";
    }

    @ResponseBody
    @RequestMapping(value = "addAddress", method = RequestMethod.POST, produces = {"application/json;charset=utf-8"})
    public String addAddress(HttpSession session, Integer id, String name, String phone, String remark, String address) {
        User user = (User) session.getAttribute("loginUser");

        UserAddress userAddress=new UserAddress(user.getId(), address, remark, phone, name);

        Integer row = addressService.addAddress(userAddress);

        Integer addressId = userAddress.getId();

        if (row > 0) {
            return JSON.toJSONString(addressId);
        } else {
            return JSON.toJSONString("添加失败");
        }
    }

    @RequestMapping(value = "queryAddressById", method = RequestMethod.GET, produces = {"application/json;charset=utf-8"})
    public String queryAddressById(Integer id, Model model) {
        UserAddress userAddress = addressService.queryAddressById(id);
        System.out.println(userAddress);
        model.addAttribute("userAddress", userAddress);
        return "address/success";
    }
}
