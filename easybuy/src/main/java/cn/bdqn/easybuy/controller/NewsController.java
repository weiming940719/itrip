package cn.bdqn.easybuy.controller;

import cn.bdqn.easybuy.command.util.Message;
import cn.bdqn.easybuy.entity.News;
import cn.bdqn.easybuy.service.news.NewsService;
import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

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

    @ResponseBody
    @RequestMapping(value = "addNews",method = RequestMethod.POST,
            produces = {"application/json;charset=utf-8"})
    public String addNews(News news) {
        Integer row = newsService.addNews(news);
        if (row > 0) {
            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.error());
    }

    @ResponseBody
    @RequestMapping(value = "deleteMoreNews",method = RequestMethod.POST,
            produces = {"application/json;charset=utf-8"})
    public String deleteMoreNews(String ids) {
        String[] idsArray = ids.split(",");
        List<Integer> list = new ArrayList<>();
        if (idsArray != null) {
            for (String s : idsArray) {
                list.add(Integer.parseInt(s));
            }
        }
        Integer row = newsService.deleteMoreNews(list);
        if (row > 0) {
            return JSON.toJSONString(Message.success());
        } else {
            return JSON.toJSONString(Message.error());
        }
    }
    @ResponseBody
    @RequestMapping(value = "queryNewsById",method = RequestMethod.POST,
            produces = {"application/json;charset=utf-8"})
    public String queryNewsById(Integer id) {
        News news=newsService.queryNewsTitle(id);
        return JSON.toJSONString(news);
    }

    @ResponseBody
    @RequestMapping(value = "updateNews",method = RequestMethod.POST,
            produces = {"application/json;charset=utf-8"})
    public String updateNews(News news) {
       Integer row=newsService.updateNews(news);
        if (row > 0) {
            return JSON.toJSONString(Message.success());
        } else {
            return JSON.toJSONString(Message.error());
        }
    }
}
