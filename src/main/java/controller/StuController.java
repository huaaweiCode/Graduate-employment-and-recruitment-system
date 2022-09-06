package controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.Kv;
import com.jfinal.kit.LogKit;
import com.jfinal.kit.PathKit;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.SqlPara;
import com.jfinal.upload.UploadFile;
import interceptor.Login;
import model.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

@Before(Login.class)
public class StuController extends Controller {
    public void DoModifyWhereabouts(){
        String companyName = getPara("companyName");
        String occupation = getPara("Occupation");
        String address = getPara("address");
        Integer stuID = getParaToInt("stuID");
         Db.update("update whereabouts set companyName=?,Occupation=?,address=? where stuId=?",companyName,occupation,address,stuID);
        boolean success = true;
        String message = success ? "修改成功" : "修改失败";
        Kv result = Kv.by("success", success).set("message", message);
        renderJson(result);
    }
    public void modifyWhereabouts(){
        Stu user = getSessionAttr("user");
        setAttr("student",user);
        Integer sutID = getParaToInt(0, -1);
        Integer whereaboutsId = getParaToInt(1, -1);
        Whereabouts whereabouts = Whereabouts.dao.findById(whereaboutsId);
        setAttr("whereabouts",whereabouts);
        renderFreeMarker("modifyWhereabouts.ftl");

    }
    public void findWhereabouts(){
        Stu user = getSessionAttr("user");

        List<Whereabouts> whereabouts = Whereabouts.dao.find("SELECT whereabouts.* ,stu.name,stu.tel,stu.major,stu.degree FROM whereabouts,stu where whereabouts.stuId=stu.stuID and whereabouts.stuId=?",user.getStuID());
        if(!whereabouts.isEmpty()){ 
            setAttr("whereabouts",whereabouts.get(0));
            setAttr("flag",0);
        }else{
            setAttr("flag",1);
        }

        renderFreeMarker("findWhereabouts.ftl");
    }

    public void saveWhereabouts(){
        String companyName = getPara("companyName");
        String occupation = getPara("Occupation");
        String address = getPara("address");
        Integer stuID = getParaToInt("stuID");
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
    public void whereabouts(){
        Stu user = getSessionAttr("user");
        setAttr("student",user);
        List<Whereabouts> whereabouts = Whereabouts.dao.find("select * from whereabouts where stuId=?", user.getStuID());
        setAttr("whereabouts",whereabouts);
        renderFreeMarker("whereabouts.ftl");
    }

    public void examine(){

        Stu user = getSessionAttr("user");
        List<Request> requests = Request.dao.find("select request.*,company.name from request,company where sname=? and request.cname=company.cname ",user.getSname());

        setAttr("requests",requests);
        renderFreeMarker("examine.ftl");

    }

    public void logout() {

        removeSessionAttr("user");
        redirect("/login");
    }

    public void SendResume(){

        Integer para = getParaToInt(0, -1);
        String stu_query_company_info = Db.getSql("stu_query_company_info");

        List<Record> Record = Db.find(stu_query_company_info, para);

        Stu user = getSessionAttr("user");
        List<Stu> stus = Stu.dao.find("select * from stu where stuID=? ", user.getStuID());
        Request request = new Request();

        request.setCname( Record.get(0).get("cname"));
        request.setRecruitId(para);
        request.setSname(stus.get(0).getSname());
        request.setResume(stus.get(0).getResume());
        request.setStatus(0);
        request.save();

        SqlPara stu_find_allrecruit = Db.getSqlPara("stu_find_allrecruit",stus.get(0).getSname());
        Integer pageNumber = getParaToInt("page", 1);
        Page<Recruit> page = Recruit.dao.paginate(pageNumber, 10, stu_find_allrecruit);
        setAttr("page", page);

       redirect("/student/recruit");

    }

    public void upload() {


        Boolean success = false;
        UploadFile upload = this.getFile();
        String fileName = upload.getOriginalFileName();
//      UploadFile upFile = getFile("file", "", maxSize, "utf-8");// maxsize限制上传文件的大小，也可以在配置文件中设置

        File file = upload.getFile();
        String contentType = upload.getContentType();


        String webRootPath = PathKit.getWebRootPath();//得到web路径

        PropKit.use("myconfig.properties");//从配置文件中读取保存路径
//            String saveFilePathforimage = PropKit.get("saveFilePathforimage");
        String saveFilePathforimage = webRootPath + "\\template\\resume\\";

        String filename = file.getName();

        String savaFileName = filename;

        System.out.println("保存路径=" + saveFilePathforimage);
        String saveNme = saveFilePathforimage + savaFileName;

        String mysql_save_Path = "/template/resume/" + savaFileName;


        File Direction = new File(saveFilePathforimage);
        //判断文件夹是否存在 如果不存在 就创建文件夹
        if (!Direction.exists()) {
            Direction.mkdirs();
        }

        File t = new File(saveNme);
        try {
            t.createNewFile();
            Stu stu = getSessionAttr("user");
            //D:\2018.6.9\src\main\webapp\img\aef5b341-3cdb-4331-b2f5-8d6fa99ce4e7
            Db.update("update stu set resume =? where stuID=? ", mysql_save_Path, stu.getStuID());
            success = true;
        } catch (Exception e) {
            e.printStackTrace();
            LogKit.error("上传失败，原因是：" + e.getMessage());
        }
        fileChannelCopy(file, t);
        file.delete();


        String message = success ? "上传成功" : "上传失败";
        Kv result = Kv.by("success", success).set("message", message);
        renderJson(result);
    }

    public void fileChannelCopy(File s, File t) {
        FileInputStream fi = null;
        FileOutputStream fo = null;
        FileChannel in = null;
        FileChannel out = null;
        try {
            fi = new FileInputStream(s);
            fo = new FileOutputStream(t);
            in = fi.getChannel();//得到对应的文件通道
            out = fo.getChannel();
            in.transferTo(0, in.size(), out);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                fi.close();
                in.close();
                fo.close();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public void upload_resume() {
        renderFreeMarker("upload_resume.ftl");

    }

    public void modify_applyinfo() {

        String name = getPara("name");
        String password = getPara("password");
        String tel = getPara("tel");
        String email = getPara("email");
        String university = getPara("university");
        String major = getPara("major");
        String degree = getPara("degree");
        String introduction = getPara("introduction");
        Integer stuID = getParaToInt("stuID");
        String gender = getPara("gender");

        boolean success = false;
        try {
            Db.update("update stu set name=?,password=?,tel=?,email=?,university=?,major=?,degree=?,introduction=? ,gender=?where stuID=?",
                    name, password, tel, email, university, major, degree, introduction,gender, stuID);
            success = true;

        } catch (Exception e) {
            LogKit.error("修改失败，原因是：" + e.getMessage());
        }
        String message = success ? "修改成功" : "修改失败";
        Kv result = Kv.by("success", success).set("message", message);
        System.out.print(success);
        renderJson(result);
    }

    public void modify_personainfo() {
        Stu userstu = getSessionAttr("user");
        List<Stu> stus = Stu.dao.find("select * from stu where stuID =? ", userstu.getStuID());
        setAttr("stu", stus.get(0));
        renderFreeMarker("modify_personainfo.ftl");
    }

    public void personainfo() {


        Stu userstu = getSessionAttr("user");
        List<Stu> stus = Stu.dao.find("select * from stu where stuID =? ", userstu.getStuID());
        setAttr("stu", stus.get(0));

        renderFreeMarker("personainfo.ftl");

    }

    public void companyInfo() {
        Integer para = getParaToInt(0, -1);

        String stu_query_company_info = Db.getSql("stu_query_company_info");

        List<Recruit> recruits = Recruit.dao.find(stu_query_company_info, para);

        setAttr("recruit", recruits.get(0));

        renderFreeMarker("companyInfo.ftl");

    }

    public void query_recruit_result() {

        Integer pageNumber = getParaToInt("page", 1);
        Page<Recruit> page = Recruit.dao.paginate(pageNumber, 10, select, stu_queryRecruit);
        setAttr("page", page);

        renderFreeMarker("AllRecruit.ftl");
    }

    public static String select;
    public static String stu_queryRecruit;

    public void query_recruit() {
        Integer salary = getParaToInt("salary", -1);
        String degree = getPara("degree", "null");
        String address = getPara("address", "null");

//        String stu_queryRecruit = Db.getSql("stu_queryRecruit");
        select = "select * ";
        stu_queryRecruit = " FROM\n" +
                "\t(\n" +
                "\t\tSELECT\n" +
                "\t\t\trecruit.*,company.`name`\n" +
                "\t\tFROM\n" +
                "\t\t\trecruit,\n" +
                "\t\t\tcompany\n" +
                "\t\tWHERE\n" +
                "\t\t\trecruit.cname = company.cname\n" +
                "\t) AS t ";

        if (salary != -1) {
            stu_queryRecruit = stu_queryRecruit + " where salary >= " + salary;
        }
        if (!degree.equals("null")) {
            if (salary != -1) {
                stu_queryRecruit = stu_queryRecruit + " and degree = \"" + degree + "\"";
            } else {
                stu_queryRecruit = stu_queryRecruit + "where degree = \"" + degree + "\"";
            }
        }

        if (!address.equals("null")) {
            if ((salary == -1) & (degree.equals("null"))) {
                stu_queryRecruit = stu_queryRecruit + " where address = \"" + address + "\" ";
            } else {
                stu_queryRecruit = stu_queryRecruit + " and address = \"" + address + "\" ";
            }
        }
        System.out.println("sql查询语句为=" + stu_queryRecruit);

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

    public void recruit() {

        Stu user = getSessionAttr("user");
        List<Stu> stus = Stu.dao.find("select * from stu where stuID=? ", user.getStuID());
        SqlPara stu_find_allrecruit = Db.getSqlPara("stu_find_allrecruit",stus.get(0).getSname());
        Integer pageNumber = getParaToInt("page", 1);
        Page<Recruit> page = Recruit.dao.paginate(pageNumber, 10, stu_find_allrecruit);
        setAttr("page", page);

        renderFreeMarker("AllRecruit.ftl");

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


    public void mainPage() {
        List<News> newsList = News.dao.find("select * from news  limit 7");
        List<Recruit> recruitList = Recruit.dao.find("select * from recruit,company where recruit.cname=company.cname LIMIT 5");
        setAttr("newsList", newsList);
        setAttr("recruitList", recruitList);

        renderFreeMarker("mainPage.ftl");

    }

    public void index() {

        List<News> newsList = News.dao.find("select * from news limit 7");
        List<Recruit> recruitList = Recruit.dao.find("select * from recruit,company where recruit.cname=company.cname LIMIT 5");

        setAttr("newsList", newsList);
        setAttr("recruitList", recruitList);

        renderFreeMarker("mainPage.ftl");
    }
}
