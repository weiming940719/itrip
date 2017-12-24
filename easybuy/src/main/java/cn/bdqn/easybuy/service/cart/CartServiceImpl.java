package cn.bdqn.easybuy.service.cart;


import cn.bdqn.easybuy.dao.cart.CartMapper;
import cn.bdqn.easybuy.dao.prodcut.ProductMapper;
import cn.bdqn.easybuy.entity.Cart;
import cn.bdqn.easybuy.entity.CartList;
import cn.bdqn.easybuy.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2017/12/20.
 */
@Service
public class CartServiceImpl implements CartService {

    @Autowired
    @Qualifier("cartMapper")
    private CartMapper cartMapper;
    @Resource
    private ProductMapper productMapper;


    @Override
    public String saveProductToCart(Integer id, Integer quantity, CartList cartList) {
        Product product = productMapper.queryProductDetail(id);
        if (product.getStock() < quantity) {
            return "库存不足";
        }
        int row = cartMapper.saveProductToCart(new Cart(product, quantity), cartList);
        if (row > 0) {
            return "添加成功";
        }
        return "添加失败";
    }

    @Override
    public Integer deleteProductFromCart(Integer id, CartList cartList) {
        return cartMapper.deleteProductFromCart(id, cartList);
    }

    @Override
    public Cart updateCart(Integer id, Integer quantity, CartList cartList) {

        Cart cart = cartMapper.updateCart(id, quantity, cartList);
        if (cart != null) {
            if (cart.getQuantity() > cart.getProduct().getStock()) {
                System.out.println("quantity======>" + cart.getQuantity());
                System.out.println("stock=========>" + cart.getProduct().getStock());
                return null;
            }
            return cart;
        }
        return null;
    }

    @Override
    public CartList flushCart(CartList cartList) {
        cartList.setSum(cartMapper.getTotalCost(cartList));
        return cartList;
    }
}
