package common;

import com.jfinal.config.*;
import com.jfinal.core.JFinal;
import com.jfinal.ext.handler.ContextPathHandler;
import com.jfinal.ext.interceptor.SessionInViewInterceptor;
import com.jfinal.kit.PathKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.template.Engine;
import controller.*;
import jfinal.ext.freemarker.FreemarkerHelper;
import model._MappingKit;

public class MainConfig extends JFinalConfig {
    @Override
    public void configConstant(Constants constants) {
        //加载配置文件，文件路径/resources
        loadPropertyFile("myconfig.properties");
        //还有另一种方法 PropKit.use("myconfig.properties");可以在其他地方使用，但是上述的方法不可以读取配置文件，
        //设置开发模式，读取配置文件中的设置值，若无则为false
        constants.setDevMode(getPropertyToBoolean("devMode", false));
        //注册freemarker扩展标签，实现模板继承
        FreemarkerHelper.registerExtensionTag();
        constants.setMaxPostSize(1024*1024*1024);//设置上传的大小

    }

    @Override
    public void configRoute(Routes routes) {
        //设置模板文件的根目录路径， 从webapp开始    /template 表明模板要放到template目录中
        routes.setBaseViewPath("/template");
        /*注册一个路由   /开头的url由MainController处理，viewPath参数设置该控制器的模板子目录
        从BaseViewPath开始的路径 默认为controllerKey*/
        //routes.add("/category", CategoryController.class); 第三个参数//模板路径 /template
        routes.add("/", MainController.class, "");
        routes.add("/student", StuController.class,"stu");
        routes.add("/admin", UserAdminController.class,"useradmin");
        routes.add("/company", CompanyController.class,"company");

    }

    @Override
    public void configEngine(Engine engine) {

    }

    @Override
    public void configPlugin(Plugins plugins) {
        //从myconfig.properties中读取数据库jdbc连接信息 建立一个Druid数据库连接池插件
        DruidPlugin dp = new DruidPlugin(getProperty("jdbcUrl"),
                getProperty("user", "root"),
                getProperty("password", "password"));

        plugins.add(dp);
        //创建ActiveRecord插件
        ActiveRecordPlugin arp = new ActiveRecordPlugin(dp);
        //设置SQL方言为MySQL
        arp.setDialect(new MysqlDialect());
        plugins.add(arp);

        _MappingKit.mapping(arp);

        arp.setBaseSqlTemplatePath(PathKit.getRootClassPath());
        arp.addSqlTemplate("sql.jtl");

    }

    @Override
    public void configInterceptor(Interceptors interceptors) {
        //添加Session拦截器，可以在模板中使用会话
        interceptors.add(new SessionInViewInterceptor());
    }

    @Override
    public void configHandler(Handlers handlers) {
        //添加上下文handler，可以在模板中使用${base}获取应用上下文路径
        handlers.add(new ContextPathHandler("base"));

    }

    public static void main(String[] args) {
        //使用Jetty运行Jfinal项目   port参数为端口默认8080， context为上下文路径
        //完整的项目URL   http://server_or_ip:port/context/controller-key
        JFinal.start("src/main/webapp", 8080, "/");
       // JFinal.start("src/main/webapp", 8080, "/", 15);
        //加上15之后   链接数据库的时候会报错的
    }
}
