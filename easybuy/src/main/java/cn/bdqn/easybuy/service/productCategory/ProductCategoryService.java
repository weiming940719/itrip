package cn.bdqn.easybuy.service.productCategory;

import cn.bdqn.easybuy.entity.ProductCategory;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2017/12/18.
 */
public interface ProductCategoryService {

    List<ProductCategory> queryCategoryFirst();

    List<ProductCategory> queryCategorySecond(@Param("first") Integer first);

    List<ProductCategory> queryCategoryThree(@Param("second") Integer second);

    List<ProductCategory> queryCateagory();

    PageInfo<ProductCategory> queryAllProductCateGory(Integer pageNum, Integer pageSize);

    List<ProductCategory> queryCategoryFirsts();

    Integer deleteProductCategorys(Integer productCategoryId);


    Integer saveFirstProductCategory(String name);
    Integer saveSecondProductCategory(ProductCategory productCategory);
    Integer saveThirdProductCategory(ProductCategory productCategory);
    List<ProductCategory> queryCategorySecondToAdd();

}
