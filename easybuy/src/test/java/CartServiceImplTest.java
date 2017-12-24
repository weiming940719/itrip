import cn.bdqn.easybuy.dao.cart.CartMapper;
import cn.bdqn.easybuy.entity.Cart;
import cn.bdqn.easybuy.entity.CartList;
import cn.bdqn.easybuy.service.cart.CartService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2017/12/20.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class CartServiceImplTest {
    @Resource
    private CartService cartService;

    @Resource
    private CartMapper cartMapper;

    @Test
    public void saveProductToCart() throws Exception {
        CartList cartList = new CartList();
        System.out.println(cartService.saveProductToCart(733, 4, cartList));
        System.out.println(cartService.saveProductToCart(733, 4, cartList));
        for(Cart c:cartList.getCarts()){
            System.out.println(c);
        }
    }

    @Test
    public void deleteProductFromCart() throws Exception {
        CartList cartList = new CartList();
        System.out.println(cartService.saveProductToCart(733, 4, cartList));
        System.out.println(cartService.saveProductToCart(733, 4, cartList));
        System.out.println(cartService.saveProductToCart(735, 4, cartList));
        System.out.println(cartList.getCarts().size());
        System.out.println(cartService.deleteProductFromCart(735, cartList));
        System.out.println(cartList.getCarts().size());

    }

    @Test
    public void updateCart() throws Exception {
        CartList cartList = new CartList();
        System.out.println(cartService.saveProductToCart(733, 1, cartList));
        System.out.println(cartService.saveProductToCart(735, 1, cartList));
        System.out.println(cartService.saveProductToCart(736, 1, cartList));
        System.out.println(cartService.saveProductToCart(735, 1, cartList));
        System.out.println(cartService.saveProductToCart(736, 1, cartList));
        for(Cart cart:cartList.getCarts()){
            System.out.println(cart);
        }


        System.out.println(cartMapper.updateCart(733, 2, cartList));
        System.out.println(cartMapper.updateCart(735, 2, cartList));
        System.out.println(cartMapper.updateCart(736, 2, cartList));
        System.out.println(cartMapper.updateCart(735, 3, cartList));
        System.out.println(cartService.updateCart(736, 3, cartList));
        for (Cart c : cartList.getCarts()) {
            System.out.println(c.getQuantity());
        }
        cartService.flushCart(cartList);
        System.out.println(cartList.getSum());
    }

}