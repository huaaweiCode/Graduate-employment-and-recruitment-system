package controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.Kv;
import com.jfinal.kit.LogKit;
import com.jfinal.plugin.activerecord.Db;
import interceptor.LoginValidator;
import model.*;

import java.util.List;


public class MainController extends Controller {


    public void index() {
        renderFreeMarker("login.ftl");

    }


    public void register() {
        renderFreeMarker("register.ftl");
    }
    public void registerStu(){
        renderFreeMarker("registerStu.ftl");
    }
    public void registerCompany(){
        renderFreeMarker("registerCompany.ftl");
    }

    public void Company_Register() {
        String cname = getPara("cname");
        String name = getPara("name");
        String password = getPara("password");
        String address = getPara("address");
        String tel = getPara("tel");
        String detail = getPara("detail");
        int stuffNumber = getParaToInt("stuffNumber");

        Company company = new Company();
        company.setCname(cname);
        company.setName(name);
        company.setAddress(address);
        company.setStatus(1);
        company.setTel(tel);
        company.setNumber(stuffNumber);
        company.setDetail(detail);
        company.setPassword(password);

        boolean success = false;
        try {
            company.save();
            success = true;
        } catch (Exception e) {
            LogKit.error("用户注册失败，原因是：" + e.getMessage());
        }
        String message = success ? "注册成功" : "注册失败";
        Kv result = Kv.by("success", success).set("message", message);
        renderJson(result);
    }

    public void Stu_Register() {
        String sname = getPara("sname");
        String name = getPara("name");
        String password = getPara("password");
        String gender = getPara("gender");
        String email = getPara("email");
        String tel = getPara("tel");
        String degree = getPara("degree");
        String university = getPara("university");
        String introduction = getPara("introduction");
        String major = getPara("major");
        int stuID = getParaToInt("stuID");

        Stu stu = new Stu();
        stu.setSname(sname);
        stu.setName(name);
        stu.setPassword(password);
        stu.setGender(gender);
        stu.setEmail(email);
        stu.setDegree(degree);
        stu.setMajor(major);
        stu.setTel(tel);
        stu.setUniversity(university);
        stu.setIntroduction(introduction);
        stu.setStuID(stuID);

        boolean success = false;
        try {
            stu.save();
            success = true;
        } catch (Exception e) {
            LogKit.error("用户注册失败，原因是：" + e.getMessage());
        }
        String message = success ? "注册成功" : "注册失败";
        Kv result = Kv.by("success", success).set("message", message);
        renderJson(result);
    }

    public void login() {
        renderFreeMarker("login.ftl");
    }


    @Before(LoginValidator.class)
    public void loginCheck() {
        String username = getPara("username");
        String password = getPara("password");
        String usertype = getPara("usertype");
        boolean success = false;
        int flag = 0;
        if (usertype.equals("1")){
            String sql_stu = Db.getSql("check_login_stu");
            List<Stu> stus = Stu.dao.find(sql_stu, username, password);
            System.out.println("stus size="+stus.size());
            if (stus.size() != 0) {
//                removeSessionAttr()
                setSessionAttr("user", stus.get(0));
                success = true;
                flag = 1;
            } else {
                    setAttr("errmsg", "用户名或密码错误");
                }
        }else if(usertype.equals("2")){
            String sql_company = Db.getSql("check_login_company");
            List<Company> companies = Company.dao.find(sql_company, username, password);
            System.out.println("companies size="+companies.size());
            if (companies.size() != 0) {
                setSessionAttr("user", companies.get(0));
                success = true;
                flag = 2;
            } else {
                setAttr("errmsg", "用户名或密码错误");
            }

        }else if (usertype.equals("3")){
            String sql_admin = Db.getSql("check_login_admin");
            List<Useradmin> useradmins = Useradmin.dao.find(sql_admin, username, password);
            System.out.println("useradmins size="+useradmins.size());
            if (useradmins.size() != 0) {
                setSessionAttr("user", useradmins.get(0));
                success = true;
                flag = 3;
            } else {
                setAttr("errmsg", "用户名或密码错误");
            }
        }
        String message = success ? "登录成功" : "登录失败,密码或者用户名错误";
        Kv result = Kv.by("success", success).set("message", message).set("flag", flag);
        renderJson(result);
    }

    public void logout() {
        removeSessionAttr("users");
        redirect("/login");
    }


}
