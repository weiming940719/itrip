import cn.bdqn.easybuy.entity.Product;
import cn.bdqn.easybuy.service.product.ProductService;
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
public class ProductTest {
    @Resource
    private ProductService productService;
    /*查询所有商品，并分页*/
    @Test
    public void testQueryAllProduct(){
        PageInfo<Product> pageInfo=productService.queryAllProduct(3,3);
        if (pageInfo!=null) {
            List<Product> list=pageInfo.getList();
            for (Product product : list) {
                System.out.println(product);
            }
        }
    }
    /*商品上架*/
    @Test
    public void  addProduct(){
        /* (name, description, price, stock, categoryLevel1Id, categoryLevel2Id, categoryLevel3Id, fileName, isDelete)
       */
        Product product=new Product();
        product.setName("雅诗");
        product.setDescription("");
        product.setPrice(1889);
        product.setStock(5);
       /* product.setCategoryLevel1Id(548);
        product.setCategoryLevel2Id(654);
        product.setCategoryLevel3Id(655);
        product.setFileName("27A1789ED5764D82A5506DF3DC3933F9.jpg");*/

        int n=productService.addProduct(product);
        System.out.println(n);


    }
    @Test
    public  void  testDeleteProduct(){
        int n=productService.deleteProduct(773);
        System.out.println(n);
    }
}
