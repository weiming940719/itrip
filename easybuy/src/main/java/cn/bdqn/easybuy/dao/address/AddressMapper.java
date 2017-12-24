package cn.bdqn.easybuy.dao.address;

import cn.bdqn.easybuy.entity.UserAddress;

import java.util.List;

/**
 * Created by Administrator on 2017/12/20 0020.
 */
public interface AddressMapper {
    List<UserAddress> queryUserAddress(Integer userId);

    Integer addAddress(UserAddress userAddress);

    UserAddress queryAddressById(Integer id);
}
