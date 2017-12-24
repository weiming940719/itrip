package cn.bdqn.easybuy.controller;

import cn.bdqn.easybuy.service.news.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Administrator on 2017/12/20 0020.
 */
@Controller
@RequestMapping("member")
public class MemberController {
    @Autowired
    private NewsService newsService;

    @RequestMapping(value = "toMember",method = RequestMethod.GET,produces = {"application/json;charset=utf-8"})
    public String toMember() {
        return "member/member";
    }


}
