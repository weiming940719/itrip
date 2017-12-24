package cn.bdqn.easybuy.controller;

import cn.bdqn.easybuy.entity.News;
import cn.bdqn.easybuy.entity.ProductCategory;
import cn.bdqn.easybuy.service.news.NewsService;
import cn.bdqn.easybuy.service.productCategory.ProductCategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2017/12/18.
 */
@Controller
@RequestMapping("index")
public class IndexController {
    @Resource
    private ProductCategoryService productCategoryService;
    @Resource
    private NewsService newsService;

    @RequestMapping("index")
    public String queryCategoryFirst(HttpSession session) {
        List<ProductCategory> list = productCategoryService.queryCateagory();
        List<News> newslist = newsService.queryAllNews();
        session.setAttribute("firstList", list);
        session.setAttribute("newsList",newslist);
        return "index";
    }


}
