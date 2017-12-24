package cn.bdqn.easybuy.controller;

import cn.bdqn.easybuy.command.util.Message;
import cn.bdqn.easybuy.entity.Product;
import cn.bdqn.easybuy.entity.ProductCategory;
import cn.bdqn.easybuy.service.product.ProductService;
import cn.bdqn.easybuy.service.productCategory.ProductCategoryService;
import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/12/19.
 */
@Controller
@RequestMapping("product")
public class ProductController {
    @Resource
    private ProductService productService;
    @Resource
    private ProductCategoryService productCategoryService;


    @RequestMapping("queryProductList")
    public String queryProductList(Integer type, String name, Integer pageNum, Integer pageSize, Model model) {
        ProductCategory product = new ProductCategory();
        product.setName(name);
        product.setType(type);
        Map<String, Object> map = productService.queryProductList(product, pageNum, pageSize);
        PageInfo<Product> pageInfo = (PageInfo<Product>) map.get("product");
        Integer count = (Integer) map.get("count");
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("count", count);
        return "product/product";
    }

    @RequestMapping("queryProductDetail")
    public String queryProductDetail(Integer id, Model model) {
        Product product = productService.queryProductDetail(id);
        model.addAttribute("product", product);
        return "product/productDetail";
    }


    @ResponseBody
    @RequestMapping(value = "queryByDetail", method = RequestMethod.GET, produces = {"application/json;charset=utf-8"})
    public String queryByDetail(Integer id) {
        Product product = productService.queryProductDetail(id);
        return JSON.toJSONString(product);
    }

    @RequestMapping("queryProductByName")
    public String queryProductByName(Integer type, String name, Integer pageNum, Integer pageSize, Model model) {
        Map<String, Object> map = productService.queryProductByName(name, pageNum, pageSize);
        PageInfo<Product> pageInfo = (PageInfo<Product>) map.get("product");
        Integer count = (Integer) map.get("count");
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("count", count);
        return "product/product";
    }


    /*产品列表*/
    @RequestMapping(value = "toProduct")
    public String toProductList(Integer pageNum, Integer pageSize, Model model) {
        PageInfo<Product> pageInfo = productService.queryAllProduct(pageNum, pageSize);
        model.addAttribute("pageInfo", pageInfo);
        return "product/productManager";
    }

    /*去添加产品*/
    @RequestMapping(value = "toAddProduct", method = RequestMethod.GET)
    public String toAddProduct(Model model) {
        return "product/addProduct";
    }

    /*删除产品*/
    @ResponseBody
    @RequestMapping(value = "deleteProduct", method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"})
    public String deleteProduct(Integer productId) {
        int n = productService.deleteProduct(productId);
        if (n > 0) {
            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.error());
    }


    @ResponseBody
    @RequestMapping(value = "deleteProductByList", method = RequestMethod.POST, produces = {"application/json;charset=utf-8"})
    public String deleteProductByList(String productIds) {
        String[] ids = productIds.split(",");
        List<Integer> list = new ArrayList<>();
        if (ids != null) {
            for (String s : ids) {
                list.add(Integer.parseInt(s));
            }
        }
        Integer row = productService.deleteProductByList(list);
        if (row != null) {
            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.error());
    }


    @ResponseBody
    @RequestMapping(value = "updateProduct", method = RequestMethod.POST, produces = {"application/json;charset=utf-8"})
    public String updateProduct(HttpServletRequest request, Integer id, String name, String description, Float price, Integer stock,
                                Integer categoryLevel1Id, Integer categoryLevel2Id, Integer categoryLevel3Id, @RequestParam(value = "fileName", required = false) MultipartFile file) {
        String fileName = null;
        if (null != file) {
            String path = request.getSession().getServletContext().getRealPath("statics" + File.separator + "files");
            System.out.println("路径==============================" + path);
            String oldFileName = file.getOriginalFilename();
            System.out.println("原始名称==============================" + oldFileName);
            String suffix = FilenameUtils.getExtension(oldFileName);
            System.out.println("文件后缀名==============================" + suffix);
            int fileSize = 5000000;
            if (file.getSize() > fileSize) {
                return JSON.toJSONString(Message.error3());
            } else if (suffix.equalsIgnoreCase("jpg")
                    || suffix.equalsIgnoreCase("png")
                    || suffix.equalsIgnoreCase("jpeg")
                    || suffix.equalsIgnoreCase("pneg")) {
                fileName = System.currentTimeMillis() + RandomUtils.nextInt(1000000) + "_Personal.jpg";
                File targetFile = new File(path, fileName);
                if (!targetFile.exists()) {
                    targetFile.mkdirs();
                }
                try {
                    file.transferTo(targetFile);
                } catch (IOException e) {
                    e.printStackTrace();
                    return JSON.toJSONString(Message.error1());
                }
            } else {
                return JSON.toJSONString(Message.error2());
            }
        }
        Product product = new Product();
        product.setName(name);
        product.setDescription(description);
        product.setPrice(price);
        product.setStock(stock);
        product.setCategoryLevel1Id(categoryLevel1Id);
        product.setCategoryLevel2Id(categoryLevel2Id);
        product.setCategoryLevel3Id(categoryLevel3Id);
        product.setId(id);
        product.setFileName(fileName);
        Integer row = productService.updateProductFile(product);
        if (row > 0) {
            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.error());
    }


    @ResponseBody
    @RequestMapping(value = "saveProduct", method = RequestMethod.POST, produces = {"application/json;charset=utf-8"})
    public String saveProduct(HttpServletRequest request, String name, String description, Float price, Integer stock,
                              Integer categoryLevel1Id, Integer categoryLevel2Id, Integer categoryLevel3Id, @RequestParam(value = "fileName", required = false) MultipartFile file) {
        String fileName = null;
        if (null != file) {
            String path = request.getSession().getServletContext().getRealPath("statics" + File.separator + "files");
            System.out.println("路径==============================" + path);
            String oldFileName = file.getOriginalFilename();
            System.out.println("原始名称==============================" + oldFileName);
            String suffix = FilenameUtils.getExtension(oldFileName);
            System.out.println("文件后缀名==============================" + suffix);
            int fileSize = 5000000;
            if (file.getSize() > fileSize) {
                return JSON.toJSONString(Message.error3());
            } else if (suffix.equalsIgnoreCase("jpg")
                    || suffix.equalsIgnoreCase("png")
                    || suffix.equalsIgnoreCase("jpeg")
                    || suffix.equalsIgnoreCase("pneg")) {
                fileName = System.currentTimeMillis() + RandomUtils.nextInt(1000000) + "_Personal.jpg";
                File targetFile = new File(path, fileName);
                if (!targetFile.exists()) {
                    targetFile.mkdirs();
                }
                try {
                    file.transferTo(targetFile);
                } catch (IOException e) {
                    e.printStackTrace();
                    return JSON.toJSONString(Message.error1());
                }
            } else {
                return JSON.toJSONString(Message.error2());
            }
        }
        Product product = new Product();
        product.setName(name);
        product.setDescription(description);
        product.setPrice(price);
        product.setStock(stock);
        product.setCategoryLevel1Id(categoryLevel1Id);
        product.setCategoryLevel2Id(categoryLevel2Id);
        product.setCategoryLevel3Id(categoryLevel3Id);
        product.setFileName(fileName);
        Integer row = productService.addProduct(product);
        if (row > 0) {
            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.error());
    }
}
