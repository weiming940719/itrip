package cn.bdqn.easybuy.service.cart;

import cn.bdqn.easybuy.entity.Cart;
import cn.bdqn.easybuy.entity.CartList;

/**
 * Created by Administrator on 2017/12/20.
 */
public interface CartService {

    String saveProductToCart(Integer id, Integer quantity, CartList cartList);

    Integer deleteProductFromCart(Integer id, CartList cartList);

    Cart updateCart(Integer id, Integer quantity, CartList cartList);

    CartList flushCart(CartList cartList);

}
