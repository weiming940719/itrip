package cn.bdqn.easybuy.dao.productCategory;

import cn.bdqn.easybuy.entity.ProductCategory;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2017/12/18.
 */
public interface ProductCategoryMapper {

    List<ProductCategory> queryCategoryFirst();

    List<ProductCategory> queryCategorySecond(@Param("first") Integer first);

    List<ProductCategory> queryCategoryThree(@Param("second") Integer second);

    List<ProductCategory> queryAllCategory();

    List<ProductCategory> queryAllProductCategory();

    List<ProductCategory> queryCategoryFirsts();

    Integer deleteProductCategory(Integer productCategoryId);

    List<ProductCategory> isDeleteProductCategory(Integer productCategoryId);

    Integer saveFirstProductCategory(String name);
    Integer saveSecondProductCategory(ProductCategory productCategory);
    Integer saveThirdProductCategory(ProductCategory productCategory);
    /*用于添加三级分类*/
    List<ProductCategory> queryCategorySecondToAdd();

}
