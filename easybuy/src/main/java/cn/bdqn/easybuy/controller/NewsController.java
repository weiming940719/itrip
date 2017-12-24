package cn.bdqn.easybuy.controller;

import cn.bdqn.easybuy.entity.News;
import cn.bdqn.easybuy.service.news.NewsService;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2017/12/21 0021.
 */
@Controller
@RequestMapping("news")
public class NewsController {
    @Resource
    private NewsService newsService;
    //根据标题查询资讯明细
    @RequestMapping(value = "queryNewsByTitle",method = RequestMethod.GET,
            produces = {"application/json;charset=utf-8"})
    public String queryNewsByTitle(Integer id,Model model) {
        News news=newsService.queryNewsTitle(id);
        model.addAttribute("news", news);
        return "member/oneNews";
    }

    //查询所有资讯明细
    @RequestMapping("queryAll")
    public String queryAll(Integer pageNum, Integer pageSize, Model model) {
        PageInfo<News> pageInfo=newsService.queryAll(pageNum,pageSize);
        model.addAttribute("pageInfo",pageInfo);
        return "member/newsMember";
    }
}
