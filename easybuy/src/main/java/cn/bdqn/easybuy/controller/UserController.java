package cn.bdqn.easybuy.controller;

import cn.bdqn.easybuy.command.util.MD5;
import cn.bdqn.easybuy.command.util.Message;
import cn.bdqn.easybuy.entity.User;
import cn.bdqn.easybuy.service.user.UserService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by admin on 2017/12/18.
 */
@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String login(User user, HttpSession httpSession, Model model) {
        User loginUser = userService.login(user);
        if (loginUser != null) {
            httpSession.setAttribute("loginUser", loginUser);
            return "index";
        }
        model.addAttribute("message", "用户名或密码错误！");
        return "user/login";
    }

    @RequestMapping(value = "doregist", method = RequestMethod.POST)
    public String doregist(User user, Model model, String password) {


        try {
            user.setPassword(MD5.getMD5(password));
        } catch (Exception e) {
            e.printStackTrace();
        }

        Integer rows = userService.regist(user);
        if (rows > 0) {
            model.addAttribute(rows);
            model.addAttribute("message", "注册成功！");
            return "user/login";
        }
        return "user/regist";
    }

    @ResponseBody
    @RequestMapping(value = "checkUserName", method = RequestMethod.POST,
            produces = {"application/json;charset=utf-8"})
    public String checkUserName(String loginName) {
        List<User> list = userService.checkUserNameByUserName(loginName);
        Map<String, String> map = new HashMap<String, String>();
        if (list != null && list.size() > 0) {
            map.put("message", "登录名存在");
        } else {
            map.put("message", "登录名可用");
        }
        return JSONArray.toJSONString(map);
    }

    @RequestMapping("toregist")
    public String toregist() {
        return "user/regist";
    }

    @RequestMapping("toLogin")
    public String toLogin() {
        return "user/login";
    }

    @RequestMapping("exist")
    public String exist(HttpSession session, HttpServletResponse response) {
        session.invalidate();
        response.setDateHeader("Expires", 0);
        response.addHeader("Cache-Control", "no-cache");
        response.addHeader("Cache-Control", "no-store");
        return "index";
    }

    @RequestMapping(value = "touser")
    public String toUserList(Integer pageNum, Integer pageSize, Model model) {
        PageInfo<User> pageInfo = userService.queryAllUser(pageNum, pageSize);
        model.addAttribute("pageInfo", pageInfo);
        return "user/user";
    }

    @ResponseBody
    @RequestMapping(value = "updateUserById", method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"})
    public String updateUserById(User users) {
        int n = userService.updateUserById(users);
        if (n > 0) {
            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.error());
    }

    @ResponseBody
    @RequestMapping(value = "detailUserById", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"}
    )
    public String detailUserById(Integer userId) {
        User users = userService.detailUser(userId);
        return JSON.toJSONString(users);

    }

    @ResponseBody
    @RequestMapping(value = "addUser", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"}
    )
    public String addUser(User users) {

        int n = userService.addUser(users);
        if (n > 0) {

            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.error());
    }

    @ResponseBody
    @RequestMapping(value = "queryUserByName", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"}
    )
    public String queryUserByName(String loginName) {
        User users = userService.queryUserByName(loginName);
        return JSON.toJSONString(users);
    }

    @ResponseBody
    @RequestMapping(value = "deleteUserById", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"}
    )
    public String deleteUserById(Integer userId) {
        int n = userService.deleteUserById(userId);
        if (n > 0) {
            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.error());
    }

}
