package controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.Kv;
import com.jfinal.kit.LogKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.SqlPara;
import interceptor.Login;
import model.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
@Before(Login.class)
public class CompanyController extends Controller {

    public void modify_applyinfo(){
        String name = getPara("name");
        String password = getPara("password");
        String tel = getPara("tel");
        String cname = getPara("cname");
        String address = getPara("address");
        String detail = getPara("detail");
        String number = getPara("number");


        boolean success = false;
        try {
            Db.update("update company set name=?,password=?,tel=?,cname=?,address=?,detail=?,number=? where cname=?",
                    name, password, tel, cname, address, detail, number, cname);
            success = true;

        } catch (Exception e) {
            LogKit.error("修改失败，原因是：" + e.getMessage());
        }
        String message = success ? "修改成功" : "修改失败";
        Kv result = Kv.by("success", success).set("message", message);
        System.out.print(success);
        renderJson(result);
    }

    public void modify_personainfo(){
        Company user = getSessionAttr("user");
        List<Company> companies = Company.dao.find("select * from company where cname =? ", user.getCname());
        setAttr("company", companies.get(0));

        renderFreeMarker("modify_personainfo.ftl");

    }

    public void personainfo(){

        Company user = getSessionAttr("user");
        List<Company> companies = Company.dao.find("select * from company where cname =? ", user.getCname());
        setAttr("company", companies.get(0));

        renderFreeMarker("personainfo.ftl");

    }

    public void refuse(){
        Integer paraToInt = getParaToInt(0, -1);
        int update = Db.update("update request  set status =2 where id=?", paraToInt);

        String company_find_examine = Db.getSql("company_find_examine");
        Company user = getSessionAttr("user");
        List<Request> requests = Request.dao.find(company_find_examine, user.getCname());
        setAttr("requests",requests);
        renderFreeMarker("examine.ftl");
    }

    public void pass(){
        Integer paraToInt = getParaToInt(0, -1);
        int update = Db.update("update request  set status =1 where id=?", paraToInt);

        String company_find_examine = Db.getSql("company_find_examine");
        Company user = getSessionAttr("user");
        List<Request> requests = Request.dao.find(company_find_examine, user.getCname());
        setAttr("requests",requests);
        renderFreeMarker("examine.ftl");
    }

    public void examine(){

        String company_find_examine = Db.getSql("company_find_examine");
        Company user = getSessionAttr("user");
        List<Request> requests = Request.dao.find(company_find_examine, user.getCname());
        setAttr("requests",requests);
        renderFreeMarker("examine.ftl");

    }

    public void delete(){
        Integer paraToInt = getParaToInt(0, -1);
        try {
            Db.delete("DELETE FROM recruit where recruit.recruitid=? ", paraToInt);
        } catch (Exception e) {
            LogKit.error("删除失败，原因是：" + e.getMessage());
        }

        redirect("/company/ManageRecruit");

    }

    public void edit_save(){

        String position = getPara("position");
        Integer salary = getParaToInt("salary");
        Integer number = getParaToInt("number");
        String inf = getPara("inf");
        String degree = getPara("degree");
        String address = getPara("address");
        String major = getPara("major");
        Integer recruitid = getParaToInt("recruitid");

        boolean success = false;
        try {
            Db.update("update recruit set position=?,salary=?,number=?,inf=?,degree=?,major=?,address=? where recruitid=?",
                    position, salary, number, inf, degree, major, address,recruitid);
            success = true;

        } catch (Exception e) {
            LogKit.error("修改失败，原因是：" + e.getMessage());
        }
        String message = success ? "修改成功" : "修改失败";
        Kv result = Kv.by("success", success).set("message", message);
        System.out.print(success);
        renderJson(result);
    }

    public void edit(){
        Integer paraToInt = getParaToInt(0, -1);
        List<Recruit> recruits = Recruit.dao.find("select * from recruit where recruitid=?",paraToInt);
        setAttr("recruit",recruits.get(0));

        renderFreeMarker("edit_company_info.ftl");
    }

    public void ManageRecruit(){
        Company user = getSessionAttr("user");
        List<Recruit> recruits = Recruit.dao.find("select * from recruit where cname=?",user.getCname());
        setAttr("recruits",recruits);

        renderFreeMarker("ManageRecruit.ftl");
    }

    public void add_ReleaseRecruit(){
        Company user = getSessionAttr("user");

        String position = getPara("position");
        Integer salary = getParaToInt("salary");
        Integer number = getParaToInt("number");
        String inf = getPara("inf");
        String degree = getPara("degree");
        String address = getPara("address");
        String major = getPara("major");

        Recruit recruit = new Recruit();
        recruit.setAddress(address);
        recruit.setPosition(position);
        recruit.setDegree(degree);
        recruit.setMajor(major);
        recruit.setNumber(number);
        recruit.setInf(inf);
        recruit.setSalary(salary);


        Date date=new Date();
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
        String nyr = dateFormat.format(date);
        recruit.setRecruitTime(nyr);

        recruit.setCname(user.getCname());
        recruit.save();

        Boolean success=true;
        String message = success ? "添加成功" : "添加失败";
        Kv result = Kv.by("success", success).set("message", message);
        renderJson(result);
    }

    public  void ReleaseRecruit(){
        renderFreeMarker("ReleaseRecruit.ftl");
    }



    public void AllNews() {

        SqlPara sqlPara = Db.getSqlPara("stu_find_allnews");
        Integer pageNumber = getParaToInt("page", 1);
        Page<News> page = News.dao.paginate(pageNumber, 5, sqlPara);
        setAttr("page", page);

        renderFreeMarker("AllNews.ftl");
    }

    public void news() {

        Integer para = getParaToInt(0, -1);
        String stu_find_new_id = Db.getSql("stu_find_new_id");
        List<News> news = News.dao.find(stu_find_new_id, para);
        setAttr("new", news.get(0));
        renderFreeMarker("newsInfo.ftl");
    }


    public void index() {

        List<News> newsList = News.dao.find("select * from news limit 7");
        List<Recruit> recruitList = Recruit.dao.find("select * from recruit,company where recruit.cname=company.cname LIMIT 5");
        setAttr("newsList", newsList);
        setAttr("recruitList", recruitList);

        renderFreeMarker("mainPage.ftl");
    }
}
