package cn.bdqn.easybuy.service.user;

import cn.bdqn.easybuy.entity.User;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by admin on 2017/12/18.
 */
public interface UserService{
        public User login(User user);
        public Integer regist(User user);
        public List<User> checkUserNameByUserName(String loginName);

        PageInfo<User> queryAllUser(Integer pageNum, Integer pageSize);
        Integer updateUserById(User users);
        User detailUser(Integer userId);
        Integer addUser(User users);
        User queryUserByName(String loginName);
        Integer deleteUserById(Integer userId);
}