import cn.bdqn.easybuy.entity.User;
import cn.bdqn.easybuy.service.user.UserService;
import com.github.pagehelper.PageInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 34712 on 2017/12/18.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
    public class UserTest {
    @Resource
    private UserService userService;
    @Test
    public void testQueryAllUser(){
        PageInfo<User> pageInfo=userService.queryAllUser(2,3);
        if(null!=pageInfo){
            List<User> list=pageInfo.getList();
            if(null!=list){
                for (User user : list) {
                    System.out.println(user);
                }
            }

            System.out.println("一共" + pageInfo.getTotal() + "条记录");
            System.out.println("一共" + pageInfo.getPages() + "页");
        }

    }
    /*验证用户名唯一性*/
    @Test
    public  void testQueryUserByName(){
        User users=userService.queryUserByName("admin");
        System.out.println(users);
    }
    @Test
    public void  testAddUser(){
        /*(NULL ,'春天','hda','48df',0,'7977df977979','45dd5454','45dd44545',0)*/
        User users=new User();
        users.setLoginName("露娜");
        users.setUserName("hda");
        users.setPassword("48df");
        users.setSex(1);
        users.setIdentityCode("7977df977979");
        users.setEmail("45dd5454@ja.com");
        users.setMobile("45dd44545");
        users.setType(0);
       int n=userService.addUser(users);
        System.out.println(n);
    }
    @Test
    public  void  testUpdateUserById(){
        User users=new User();
        users.setLoginName("yiyi");
        users.setUserName("李白天");
        users.setIdentityCode("7878787878787878");
        users.setEmail("hello@ja.com");
        users.setMobile("1212121212");
        users.setType(1);
        users.setId(21);
        int n=userService.updateUserById(users);
        System.out.println(n);
    }
    @Test
    public  void  testDetailUser(){
        User user=userService.detailUser(21);
        if (null!=user) {
            System.out.println(user);
        }
    }
    @Test
    public  void  testDeleteUser(){
        int n=userService.deleteUserById(59);
        System.out.println(n);
    }

}
