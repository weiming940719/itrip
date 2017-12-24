package cn.bdqn.easybuy.service.product;

import cn.bdqn.easybuy.dao.prodcut.ProductMapper;
import cn.bdqn.easybuy.entity.Product;
import cn.bdqn.easybuy.entity.ProductCategory;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/12/18.
 */
@Service
public class ProductServiceImpl implements ProductService {
    @Resource
    private ProductMapper productMapper;


    @Override
    public Map<String, Object> queryProductList(ProductCategory productCategory, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Product> products = productMapper.queryProductList(productCategory);
        PageInfo<Product> pageInfo = new PageInfo<>(products);
        Map<String, Object> map = new HashMap();
        Integer count = productMapper.queryProductCount(productCategory);
        map.put("product", pageInfo);
        map.put("count", count);
        return map;
    }

    @Override
    public Product queryProductDetail(Integer id) {
        return productMapper.queryProductDetail(id);
    }

    @Override
    public Map<String, Object> queryProductByName(String name, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Product> products = productMapper.queryProductByName(name);
        PageInfo<Product> pageInfo = new PageInfo<>(products);
        Map<String, Object> map = new HashMap();
        Integer count = productMapper.queryProductByNameCount(name);
        map.put("product", pageInfo);
        map.put("count", count);
        return map;
    }


    @Override
    public PageInfo<Product> queryAllProduct(Integer pageNum, Integer pageSize) {

        PageHelper.startPage(pageNum, pageSize);
        List<Product> list = productMapper.queryAllProduct();
        PageInfo<Product> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public Integer addProduct(Product product) {
        return productMapper.addProduct(product);
    }

    @Override
    public Integer deleteProduct(Integer productCategoryId) {
        return productMapper.deleteProduct(productCategoryId);
    }

    @Override
    public Integer deleteProductByList(List<Integer> ids) {
        return productMapper.deleteProductByList(ids);
    }

    @Override
    public Integer updateProductFile(Product product) {
        return productMapper.updateProductFile(product);
    }
}
