
import com.zq.xssdemo.modules.msg.dao.IMsgDao;
import com.zq.xssdemo.modules.msg.entity.Msg;
import com.zq.xssdemo.modules.sys.dao.IUserDao;
import com.zq.xssdemo.modules.sys.entity.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

// 加载spring配置文件
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class UserDaoTest {

    @Autowired
    private IUserDao dao;

    @Autowired
    private IMsgDao msgDao;

    @Test
    public void testMsg(){
        Msg msg = new Msg();
        msg.setId(0);
        msg.setUserId(1);
        msg.setMessage("第二条数据");
        msg.setTime(new Date());
        //msgDao.insert(msg);
//        List<Msg> list = msgDao.list();
//        for (Msg m: list
//             ) {
//            System.out.println(m.toString());
//        }
    }

    @Test
    public void testSelectUser() throws Exception {
        User findUser = new User();
        findUser.setUsername("admin1");
        findUser.setPassword("admin");
//        User user = dao.findUserByNameAndPassword(findUser);
//        System.out.println(user.getUsername());
        //dao.insert(findUser);
    }

}