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
public class UserAdminController extends Controller {
    public void deleteDetailOneWhereabouts(){
        Integer id = getParaToInt(0, 1);
        Db.delete("delete from whereabouts where id=?",id);
        SqlPara findAllWhereabouts = Db.getSqlPara("findAllWhereabouts");
        Integer pageNumber = getParaToInt("page", 1);
        Page<Recruit> page = Recruit.dao.paginate(pageNumber, 10, findAllWhereabouts);
        setAttr("page", page);
        renderFreeMarker("findAllWhereabouts.ftl");
    }

    public void DoModifyWhereabouts(){


        String name = getPara("name");
        String companyName = getPara("companyName");
        String occupation = getPara("Occupation");
        String address = getPara("address");
        Integer stuID = getParaToInt("stuID");
        Integer id = getParaToInt("id");

        Db.update("update whereabouts set companyName=?,Occupation=?,address=?,stuId=? where id=?",companyName,occupation,address,stuID,id);
        boolean success = true;
        String message = success ? "修改成功" : "修改失败";
        Kv result = Kv.by("success", success).set("message", message);
        renderJson(result);
    }
    public void modifyDetailOneWhereabouts(){
        Integer whereaboutsId = getParaToInt(0, -1);
        Whereabouts whereabouts = Whereabouts.dao.findById(whereaboutsId);
//        Stu byId = Stu.dao.findById(whereabouts.getStuId());
        List<Stu> stus = Stu.dao.find("select * from stu where stuID=?", whereabouts.getStuId());
        setAttr("student",stus.get(0));
        setAttr("whereabouts",whereabouts);
        renderFreeMarker("modifyDetailOneWhereabouts.ftl");
    }

    public void findDetailOneWhereabouts(){
        Integer whereaboutsId = getParaToInt(0, -1);
        List<Whereabouts> whereabouts = Whereabouts.dao.find("SELECT whereabouts.* ,stu.name,stu.tel,stu.major,stu.degree FROM whereabouts,stu where whereabouts.stuId=stu.stuID and id=?",whereaboutsId);
        setAttr("whereabouts",whereabouts.get(0));
        renderFreeMarker("findDetailOneWhereabouts.ftl");

    }
    public void findAllWhereabouts(){
        SqlPara findAllWhereabouts = Db.getSqlPara("findAllWhereabouts");
        Integer pageNumber = getParaToInt("page", 1);
        Page<Recruit> page = Recruit.dao.paginate(pageNumber, 10, findAllWhereabouts);
        setAttr("page", page);
        renderFreeMarker("findAllWhereabouts.ftl");
    }
    public void doAddWhereabouts(){
        Integer stuID = getParaToInt("stuID");
        String name = getPara("name");
        String occupation = getPara("Occupation");
        String companyName = getPara("companyName");
        String address = getPara("address");
        Whereabouts whereabouts = new Whereabouts();
        whereabouts.setCompanyName(companyName);
        whereabouts.setAddress(address);
        whereabouts.setOccupation(occupation);
        whereabouts.setStuId(stuID);
        whereabouts.save();
        boolean success = true;
        String message = success ? "保存成功" : "保存失败";
        Kv result = Kv.by("success", success).set("message", message);
        renderJson(result);
    }

    public void addWhereabouts(){
        renderFreeMarker("addWhereabouts.ftl");
    }

    public void deleteRecruit(){
        Integer para = getParaToInt(0, -1);
        try {
            Db.delete("DELETE FROM recruit where recruitid =?", para);
        } catch (Exception e) {
            LogKit.error("删除失败，原因是：" + e.getMessage());
        }
        redirect("/admin/listRecruit");
    }

    public void listRecruit(){


        SqlPara adminfindrecruit = Db.getSqlPara("adminfindrecruit");
        Integer pageNumber = getParaToInt("page", 1);
        Page<Recruit> page = Recruit.dao.paginate(pageNumber, 10, adminfindrecruit);
        setAttr("page", page);

        renderFreeMarker("listRecruit.ftl");
    }

    public void saveAdmin(){
        String adminName = getPara("adminName");
        String adminPassword = getPara("adminPassword");


        Useradmin useradmin = new Useradmin();
        useradmin.setAdminName(adminName);
        useradmin.setAdminPassword(adminPassword);

        boolean success = false;
        try {
            useradmin.save();
            success = true;
        } catch (Exception e) {
            LogKit.error("用户添加失败，原因是：" + e.getMessage());
        }
        String message = success ? "添加成功" : "添加失败";
        Kv result = Kv.by("success", success).set("message", message);
        renderJson(result);
    }


    public void addAdmin(){
        renderFreeMarker("addAamin.ftl");
    }


    public void deleteAdmin(){
        String adminName = getPara(0, "null");
        try {
            Db.delete("DELETE FROM useradmin where adminName =?", adminName);
        } catch (Exception e) {
            LogKit.error("删除失败，原因是：" + e.getMessage());
        }
        redirect("/admin/listAdmin");
    }

    public void domodifyAdmin(){
        String adminName = getPara("adminName");
        String adminPassword = getPara("adminPassword");
        boolean success = false;
        try {
            Db.update("update useradmin set adminPassword=? where adminName=?",
                    adminPassword, adminName);
            success = true;

        } catch (Exception e) {
            LogKit.error("修改失败，原因是：" + e.getMessage());
        }
        String message = success ? "修改成功" : "修改失败";
        Kv result = Kv.by("success", success).set("message", message);
        System.out.print(success);
        renderJson(result);
    }

    public void modifyAdmin(){
        String adminName = getPara(0, "null");

        List<Useradmin> useradmins = Useradmin.dao.find("select * from useradmin where adminName = ? ", adminName);
        setAttr("useradmin", useradmins.get(0));

        renderFreeMarker("modify_admininfo.ftl");
    }

    public void listAdmin(){
        SqlPara adminFindAlladmin = Db.getSqlPara("adminFindAlladmin");
        Integer pageNumber = getParaToInt("page", 1);
        Page<Useradmin> page = Useradmin.dao.paginate(pageNumber, 10, adminFindAlladmin);
        setAttr("page", page);
        renderFreeMarker("listAdmin.ftl");
    }


    public void releaseNew() {
        renderFreeMarker("releaseNew.ftl");
    }

    public void saveCompany() {
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

    public void addCompany() {
        renderFreeMarker("addCompany.ftl");
    }

    public void deleteCompany() {

        String cname = getPara(0, "null");
        try {
            Db.delete("DELETE FROM company where cname =?", cname);
        } catch (Exception e) {
            LogKit.error("删除失败，原因是：" + e.getMessage());
        }
        redirect("/admin/listCompany");
    }

    public void domodifyCompany() {

        String name = getPara("name");
        Integer number = getParaToInt("number");
        String cname = getPara("cname");
        String tel = getPara("tel");
        String address = getPara("address");
        String password = getPara("password");
        String detail = getPara("detail");


        boolean success = false;
        try {
            Db.update("update company set name=?,number=?,tel=?,address=?,password=?,detail=? where cname=?",
                    name, number, tel, address, password, detail, cname);
            success = true;

        } catch (Exception e) {
            LogKit.error("修改失败，原因是：" + e.getMessage());
        }
        String message = success ? "修改成功" : "修改失败";
        Kv result = Kv.by("success", success).set("message", message);
        System.out.print(success);
        renderJson(result);
    }


    public void modifyCompany() {
        String cname = getPara(0, "null");
        System.out.println("cname=" + cname);
        List<Company> companies = Company.dao.find("select * from company where cname = ? ", cname);

        setAttr("company", companies.get(0));

        renderFreeMarker("modify_companyinfo.ftl");
    }

    public void listCompany() {
        SqlPara adminFindAllcompany = Db.getSqlPara("adminFindAllcompany");
        Integer pageNumber = getParaToInt("page", 1);
        Page<Company> page = Company.dao.paginate(pageNumber, 10, adminFindAllcompany);
        setAttr("page", page);

        renderFreeMarker("listCompany.ftl");
    }

    public void saveStu() {
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
            LogKit.error("添加失败，原因是：" + e.getMessage());
        }
        String message = success ? "添加成功" : "添加失败";
        Kv result = Kv.by("success", success).set("message", message);
        renderJson(result);
    }

    public void deleteStu() {
        Integer paraToInt = getParaToInt(0, -1);
        try {
            Db.delete("DELETE FROM stu where stuID=?", paraToInt);
        } catch (Exception e) {
            LogKit.error("删除失败，原因是：" + e.getMessage());
        }
        redirect("/admin/listStu");
    }

    public void domodifyStu() {
        String name = getPara("name");
        String password = getPara("password");
        String tel = getPara("tel");
        String email = getPara("email");
        String university = getPara("university");
        String major = getPara("major");
        String degree = getPara("degree");
        String introduction = getPara("introduction");
        Integer stuID = getParaToInt("stuID");
        String sname = getPara("sname");

        boolean success = false;
        try {
            Db.update("update stu set name=?,password=?,tel=?,email=?,university=?,major=?,degree=?,introduction=? where stuID=?",
                    name, password, tel, email, university, major, degree, introduction, stuID);
            success = true;

        } catch (Exception e) {
            LogKit.error("修改失败，原因是：" + e.getMessage());
        }
        String message = success ? "修改成功" : "修改失败";
        Kv result = Kv.by("success", success).set("message", message);
        System.out.print(success);
        renderJson(result);
    }

    public void modifyStu() {
        Integer stuID = getParaToInt(0, -1);
        List<Stu> stus = Stu.dao.find("select * from stu where stuID =? ", stuID);
        setAttr("stu", stus.get(0));
        renderFreeMarker("modify_personainfo.ftl");
    }

    public void query_stu_result() {
        Integer pageNumber = getParaToInt("page", 1);
        Page<Stu> page = Stu.dao.paginate(pageNumber, 10, select, stu_querystu);
        setAttr("page", page);
        renderFreeMarker("listStu.ftl");
    }

    public static String select;
    public static String stu_querystu;

    public void query_stu() {
        Integer stuID = getParaToInt("stuID", -1);
        String name = getPara("name", "null");
        String degree = getPara("degree", "null");

//        String stu_queryRecruit = Db.getSql("stu_queryRecruit");
        select = "select * ";
        stu_querystu = "from stu ";

        if (stuID != -1) {
            stu_querystu = stu_querystu + " where stuID = " + stuID;
        }
        if (!name.equals("null")) {
            if (stuID != -1) {
                stu_querystu = stu_querystu + " and name = \"" + name + "\"";
            } else {
                stu_querystu = stu_querystu + "where name = \"" + name + "\"";
            }
        }

        if (!degree.equals("null")) {
            if ((stuID == -1) & (name.equals("null"))) {
                stu_querystu = stu_querystu + " where degree = \"" + degree + "\" ";
            } else {
                stu_querystu = stu_querystu + " and degree = \"" + degree + "\" ";
            }
        }
        System.out.println("sql查询语句为=" + stu_querystu);

        boolean success = false;
        try {
            success = true;
        } catch (Exception e) {
            LogKit.error("查询失败，原因是：" + e.getMessage());
        }
        String message = success ? "查询成功" : "查询失败";
        Kv result = Kv.by("success", success).set("message", message);
        renderJson(result);

    }

    public void addStu() {
        renderFreeMarker("addStu.ftl");
    }

    public void listStu() {
        SqlPara adminFindAllstu = Db.getSqlPara("adminFindAllstu");
        Integer pageNumber = getParaToInt("page", 1);
        Page<Stu> page = Stu.dao.paginate(pageNumber, 10, adminFindAllstu);
        setAttr("page", page);

        renderFreeMarker("listStu.ftl");
    }

    public void addNew() {

        Date date=new Date();
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
        String nyr = dateFormat.format(date);

        String title = getPara("title");
        String content = getPara("content");
        Useradmin user = getSessionAttr("user");

        News new111 = new News();
        new111.setAdminName(user.getAdminName());
        new111.setTitle(title);
        new111.setNewsTime(nyr);
        new111.setContent(content);
        boolean success = false;
        try {
            new111.save();
            success = true;

        } catch (Exception e) {
            LogKit.error("发布失败，原因是：" + e.getMessage());
        }
        String message = success ? "发布成功" : "发布失败";
        Kv result = Kv.by("success", success).set("message", message);
        System.out.print(success);
        renderJson(result);


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



