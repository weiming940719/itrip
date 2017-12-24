package cn.bdqn.easybuy.service.address;

import cn.bdqn.easybuy.dao.address.AddressMapper;
import cn.bdqn.easybuy.entity.UserAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/20 0020.
 */
@Service
public class AddressServiceImpl implements AddressService {

    @Autowired
    private AddressMapper addressMapper;
    @Override
    public List<UserAddress> queryUserAddress(Integer userId) {
        return addressMapper.queryUserAddress(userId);
    }

    @Override
    public Integer addAddress(UserAddress userAddress) {
        return addressMapper.addAddress(userAddress);
    }

    @Override
    public UserAddress queryAddressById(Integer id) {
        return addressMapper.queryAddressById(id);
    }
}
