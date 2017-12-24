import cn.bdqn.easybuy.entity.ProductCategory;
import cn.bdqn.easybuy.service.productCategory.ProductCategoryService;
import com.github.pagehelper.PageInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 34712 on 2017/12/20.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class TestProductCategory {
    @Resource
    private ProductCategoryService productCategoryService;
    @Test
    public  void  testQueryAllProductCategory(){
        PageInfo<ProductCategory> pageInfo=productCategoryService.queryAllProductCateGory(3,3);
        if (null!=pageInfo) {
            List<ProductCategory> list=pageInfo.getList();
            for (ProductCategory productCategory : list) {
                System.out.println(productCategory);
            }
        }
    }
    /*一级分类测试*/
    @Test
    public  void  testQueryProductCategoryFirst(){
        List<ProductCategory> productCategories=productCategoryService.queryCategoryFirst();
        if (null!=productCategories) {
            for (ProductCategory productCategory : productCategories) {
                System.out.println(productCategories);
            }
        }
    }
    /*二级分类*/
    @Test
    public void queryCategorySecond() throws Exception {
        for (ProductCategory p : productCategoryService.queryCategorySecond(548)) {
            System.out.println(p);
        }
    }

    @Test
    public void queryCategoryThree() throws Exception {
        for (ProductCategory p : productCategoryService.queryCategoryThree(656)) {
            System.out.println(p);
        }
    }
    /*测试删除*/
    @Test
    public  void testDeleteProductCategory(){
        Integer n=productCategoryService.deleteProductCategorys(699);
        System.out.println(n);
    }

    /*添加一级分类*/
    @Test
    public  void testAddFirstProductCategory(){
        int n=productCategoryService.saveFirstProductCategory("水");
        System.out.println(n);
    }
    /*添加二级分类*/
    @Test
    public  void testAddSecondProductCategory(){
        ProductCategory productCategory=new ProductCategory();
        productCategory.setName("土");
        productCategory.setParentId(34);
        int n=productCategoryService.saveSecondProductCategory(productCategory);
        System.out.println(n);
    }
    /*添加三级分类*/
    @Test
    public  void testAddThreeProductCategory(){
        ProductCategory productCategory=new ProductCategory();
        productCategory.setName("尘");
        productCategory.setParentId(42);
        int n=productCategoryService.saveThirdProductCategory(productCategory);
        System.out.println(n);
    }
    /*查询二级分类*/
    @Test
    public  void  testQuerySecondProductCategory(){
        List<ProductCategory> list=productCategoryService.queryCategorySecondToAdd();
        if (null!=list) {
            for (ProductCategory productCategory : list) {
                System.out.println(productCategory);
            }
        }
    }
}
