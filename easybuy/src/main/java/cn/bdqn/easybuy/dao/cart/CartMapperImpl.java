package cn.bdqn.easybuy.dao.cart;

import cn.bdqn.easybuy.entity.Cart;
import cn.bdqn.easybuy.entity.CartList;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/12/20.
 */
@Repository
public class CartMapperImpl implements CartMapper {

    // 修改一项
    public Integer saveProductToCart(Cart cart, CartList cartList) {
        List<Cart> list = cartList.getCarts();
        boolean b = true;
        for (int i = 0; i < list.size(); i++) {
            // 判断购物车中是否已有此商品，如果有则累计数量
            if ((list.get(i).getProduct().getId()) == (cart.getProduct().getId())) {
                if (list.get(i).getQuantity() + cart.getQuantity() < cart.getProduct().getStock()) {
                    list.get(i).setQuantity(list.get(i).getQuantity() + cart.getQuantity());
                    return 1;
                }
            }
        }
        if (b) {
            list.add(cart);
            return 1;
        }
        return 0;
    }

    // 移除一项
    public Integer deleteProductFromCart(Integer id, CartList cartList) {
        List<Cart> list = cartList.getCarts();
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i));
            if (list.get(i).getProduct().getId() == id) {
                list.remove(i);
                return 1;
            }
        }
        return 0;
    }

    // 修改数量
    public Cart updateCart(Integer id, Integer quantity, CartList cartList) {
        List<Cart> list = cartList.getCarts();
        for (int i = 0; i < list.size(); i++) {
            Cart cart = list.get(i);
            if (cart.getProduct().getId() == id) {
                if (quantity == -1) {
                    cart.setQuantity(cart.getQuantity() - 1);
                } else {
                    if (quantity == 1) {
                        cart.setQuantity(cart.getQuantity() + 1);
                    } else {
                        cart.setQuantity(quantity);
                    }
                }
                return cart;
            }
        }
        return null;
    }
    // 计算总价格

    public Double getTotalCost(CartList cartList) {
        Double sum = 0.0;
        for (Cart cart : cartList.getCarts()) {
            cart.setCost(cart.getQuantity() * cart.getProduct().getPrice());
            sum += cart.getCost();
        }
        return sum;
    }


}


