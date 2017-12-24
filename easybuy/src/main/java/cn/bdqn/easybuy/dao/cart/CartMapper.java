package cn.bdqn.easybuy.dao.cart;

import cn.bdqn.easybuy.entity.Cart;
import cn.bdqn.easybuy.entity.CartList;

/**
 * Created by Administrator on 2017/12/20.
 */
public interface CartMapper {
    public Integer saveProductToCart(Cart cart, CartList cartList);


    // 移除一项
    public Integer deleteProductFromCart(Integer id, CartList cartList);

    // 修改数量
    public Cart updateCart(Integer id, Integer quantity, CartList cartList);

    // 计算总价格
    public Double getTotalCost(CartList cartList);



}
