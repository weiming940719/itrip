package cn.bdqn.easybuy.service.user;

import cn.bdqn.easybuy.dao.user.UserMapper;
import cn.bdqn.easybuy.entity.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by admin on 2017/12/19.
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    public User login(User user) {
        return userMapper.login(user);
    }

    public Integer regist(User user) {
        return userMapper.regist(user);
    }

    public List<User> checkUserNameByUserName(String loginName) {
        return userMapper.checkUserNameByUserName(loginName);
    }

    @Override
    public PageInfo<User> queryAllUser(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<User> list=userMapper.queryAllUser();
        PageInfo<User> pageInfo=new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public Integer updateUserById(User users) {
        return userMapper.updateUserById(users);
    }

    @Override
    public User detailUser(Integer userId) {
        return userMapper.detailUser(userId);
    }

    @Override
    public Integer addUser(User users) {
        return userMapper.addUser(users);
    }

    @Override
    public User queryUserByName(String loginName) {
        return userMapper.queryUserByName(loginName);
    }

    @Override
    public Integer deleteUserById(Integer userId) {
        return userMapper.deleteUserById(userId);
    }
}
