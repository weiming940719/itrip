package cn.bdqn.easybuy.dao.prodcut;

import cn.bdqn.easybuy.entity.Product;
import cn.bdqn.easybuy.entity.ProductCategory;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2017/12/18.
 */
public interface ProductMapper {
    List<Product> queryProductList(ProductCategory productCategory);

    List<Product> queryProductListInIndex();

    Product queryProductDetail(@Param("id") Integer id);

    Integer queryProductCount(ProductCategory productCategory);

    Integer updateProduct(@Param("id") Integer id, @Param("quantity") Integer quantity);

    List<Product> queryProductByName(@Param("name") String name);

    Integer queryProductByNameCount(@Param("name") String name);

    List<Product> queryAllProduct();

    Integer addProduct(Product product);

    Integer deleteProduct(Integer productCategoryId);

    Integer deleteProductByList(List<Integer> ids);

    Integer updateProductFile(Product product);


}
