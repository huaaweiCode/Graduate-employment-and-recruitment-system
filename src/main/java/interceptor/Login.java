package interceptor;


import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;

import javax.naming.ldap.Control;
//拦截器可以叠加使用
public class Login  implements Interceptor {
    @Override
    public void intercept(Invocation invocation) {
        Controller controller=invocation.getController();
       // Controller.getRequest().getRemoteHost();//可以得到主机IP 控制只让某个IP地址的进来
       // Controller.getRequest().getRemotePort()
        if(controller.getSessionAttr("user")!=null){
            invocation.invoke();
        }else{
            controller.redirect("/login");
        }
    }
}
