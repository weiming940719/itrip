package cn.bdqn.easybuy.controller;

import cn.bdqn.easybuy.command.util.Message;
import cn.bdqn.easybuy.entity.ProductCategory;
import cn.bdqn.easybuy.service.productCategory.ProductCategoryService;
import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 34712 on 2017/12/20.
 */
@Controller
@RequestMapping("productCategory")
public class ProductCateGoryController {
    @Resource
    private ProductCategoryService productCategoryService;

    @RequestMapping(value = "toProductCategory", method = RequestMethod.GET,
            produces = {"application/json;charset=UTF-8"})
    public String toProductCategory(Integer pageNum, Integer pageSize, Model model) {
        PageInfo<ProductCategory> pageInfo = productCategoryService.queryAllProductCateGory(pageNum, pageSize);
        model.addAttribute("pageInfo", pageInfo);
        return "product/productCategory";

    }

  /*  *//*删除分类*//*
    @ResponseBody
    @RequestMapping(value = "deleteProductCategory", method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"})
    public String deleteProductCategory(Integer productCategoryId) {
        int n = productCategoryService.deleteProductCategorys(productCategoryId);
        if (n > 0) {
            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.error());
    }*/

    @ResponseBody
    @RequestMapping(value = "queryAllCateGory", method = RequestMethod.GET, produces = {"application/json;charset=utf-8"})
    public String queryAllCateGory(Model model) {
        List<ProductCategory> list = productCategoryService.queryCateagory();
        model.addAttribute("list", list);
        return JSON.toJSONString(list);
    }

    @ResponseBody
    @RequestMapping(value = "querySecond", method = RequestMethod.GET, produces = {"application/json;charset=utf-8"})
    public String querySecond(Integer id, Model model) {
        List<ProductCategory> list = productCategoryService.queryCategorySecond(id);
        model.addAttribute("list", list);
        return JSON.toJSONString(list);
    }

    @ResponseBody
    @RequestMapping(value = "queryThree", method = RequestMethod.GET, produces = {"application/json;charset=utf-8"})
    public String queryThree(Integer id, Model model) {
        List<ProductCategory> list = productCategoryService.queryCategoryThree(id);
        model.addAttribute("list", list);
        return JSON.toJSONString(list);
    }

    /*删除分类*/
    @ResponseBody
    @RequestMapping(value = "deleteProductCategory",method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"})
    public  String deleteProductCategory(Integer productCategoryId){
        int n=productCategoryService.deleteProductCategorys(productCategoryId);
        System.out.println("n的值为==========================================="+n);
        if (n>0) {
            System.out.println("=================================================删除成功");
            return JSON.toJSONString(Message.success());
        }
        System.out.println("================================================================删除失败");
        return  JSON.toJSONString(Message.failed());
    }

    /*添加一级分类*/
    @ResponseBody
    @RequestMapping(value = "addFirstProductCategory",method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"})
    public  String addFirstProductCategory(String name){
        int n=productCategoryService.saveFirstProductCategory(name);
        if (n>0) {
            return  JSON.toJSONString(Message.success());
        }
        return  JSON.toJSONString(Message.error());
    }
    /*添加二级分类*/
    @ResponseBody
    @RequestMapping(value = "addSceondProductCategory",method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"})
    public  String addSceondProductCategory(ProductCategory productCategory){
        int n=productCategoryService.saveSecondProductCategory(productCategory);
        if (n>0) {
            return  JSON.toJSONString(Message.success());
        }
        return  JSON.toJSONString(Message.error());
    }
    /*添加三级分类*/
    @ResponseBody
    @RequestMapping(value = "addThirdProductCategory",method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"})
    public  String addThirdProductCategory(ProductCategory productCategory){
        int n=productCategoryService.saveThirdProductCategory(productCategory);
        if (n>0) {
            return  JSON.toJSONString(Message.success());
        }
        return  JSON.toJSONString(Message.error());
    }


    /*一级分类*/
    @ResponseBody
    @RequestMapping(value = "productCateGoryFirst",method = RequestMethod.GET,
            produces = {"application/json;charset=UTF-8"})
    public  String productCateGoryFirst(){
        List<ProductCategory> productCateGoryFirst=productCategoryService.queryCategoryFirsts();
        return JSON.toJSONString(productCateGoryFirst);
    }
    /*查询所有二级分类*/
    @ResponseBody
    @RequestMapping(value = "querySecondProductCategory",method = RequestMethod.GET,
            produces = {"application/json;charset=UTF-8"})
    public  String querySecondProductCategory(){
        List<ProductCategory> productCategorieSecond=productCategoryService.queryCategorySecondToAdd();
        return  JSON.toJSONString(productCategorieSecond);
    }


}
