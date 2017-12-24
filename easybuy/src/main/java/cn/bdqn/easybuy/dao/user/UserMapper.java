package cn.bdqn.easybuy.dao.user;

import cn.bdqn.easybuy.entity.User;

import java.util.List;

/**
 * Created by admin on 2017/12/18.
 */
public interface UserMapper {
    public User login(User user);

    public Integer regist(User user);

    public List<User> checkUserNameByUserName(String loginName);

    List<User> queryAllUser();
    Integer updateUserById(User users);
    User detailUser(Integer userId);
    Integer addUser(User users);
    User queryUserByName(String loginName);

    Integer deleteUserById(Integer userId);
}
