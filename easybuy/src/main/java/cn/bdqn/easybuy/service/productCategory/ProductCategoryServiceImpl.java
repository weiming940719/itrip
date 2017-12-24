package cn.bdqn.easybuy.service.productCategory;

import cn.bdqn.easybuy.dao.productCategory.ProductCategoryMapper;
import cn.bdqn.easybuy.entity.ProductCategory;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/12/18.
 */
@Service
public class ProductCategoryServiceImpl implements ProductCategoryService {
    @Resource
    private ProductCategoryMapper productCategoryMapper;

    @Override
    public List<ProductCategory> queryCategoryFirst() {
        return productCategoryMapper.queryCategoryFirst();
    }

    @Override
    public List<ProductCategory> queryCategorySecond(Integer first) {
        return productCategoryMapper.queryCategorySecond(first);
    }

    @Override
    public List<ProductCategory> queryCategoryThree(Integer second) {
        return productCategoryMapper.queryCategoryThree(second);
    }

    @Override
    public List<ProductCategory> queryCateagory() {
        List<ProductCategory> productCategories1 = productCategoryMapper.queryCategoryFirst();
        for (ProductCategory p1 : productCategories1) {
            List<ProductCategory> productCategories2 = productCategoryMapper.queryCategorySecond(p1.getId());
            p1.setProductCategories(productCategories2);
            for (ProductCategory p2 : productCategories2) {
                List<ProductCategory> productCategories3 = productCategoryMapper.queryCategoryThree(p2.getId());
                p2.setProductCategories(productCategories3);
            }
        }
        return productCategories1;
    }
    @Override
    /*用于展示所有商品分类列表*/
    public PageInfo<ProductCategory> queryAllProductCateGory(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<ProductCategory> list=productCategoryMapper.queryAllProductCategory();
        PageInfo<ProductCategory> pageInfo=new PageInfo<>(list);
        return pageInfo;
    }
    /*一级分类*/
    @Override
    public List<ProductCategory> queryCategoryFirsts() {
        return productCategoryMapper.queryCategoryFirsts();
    }
    @Override
    public Integer deleteProductCategorys(Integer productCategoryId) {

        List<ProductCategory> list=productCategoryMapper.isDeleteProductCategory(productCategoryId);
        System.out.println("Service层 是否删除 查询结果list=================================>"+list.size());
        int size=list.size();
        if(size>0) {
            return 0;
        }
        return productCategoryMapper.deleteProductCategory(productCategoryId);
    }



    @Override
    public Integer saveFirstProductCategory(String name) {
        return productCategoryMapper.saveFirstProductCategory(name);
    }

    @Override
    public Integer saveSecondProductCategory(ProductCategory productCategory) {
        return productCategoryMapper.saveSecondProductCategory(productCategory);
    }

    @Override
    public Integer saveThirdProductCategory(ProductCategory productCategory) {
        return productCategoryMapper.saveThirdProductCategory(productCategory);
    }

    @Override
    public List<ProductCategory> queryCategorySecondToAdd() {
        return productCategoryMapper.queryCategorySecondToAdd();
    }

}
