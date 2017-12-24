package cn.bdqn.easybuy.service.product;

import cn.bdqn.easybuy.entity.Product;
import cn.bdqn.easybuy.entity.ProductCategory;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/12/18.
 */
public interface ProductService {
    Map<String, Object> queryProductList(ProductCategory productCategory, Integer pageNum, Integer pageSize);

    Product queryProductDetail(@Param("id") Integer id);

    Map<String, Object> queryProductByName(@Param("name") String name, Integer pageNum, Integer pageSize);

    PageInfo<Product> queryAllProduct(Integer pageNum, Integer pageSize);

    Integer addProduct(Product product);

    Integer deleteProduct(Integer productCategoryId);

    Integer deleteProductByList(List<Integer> ids);

    Integer updateProductFile(Product product);

}
