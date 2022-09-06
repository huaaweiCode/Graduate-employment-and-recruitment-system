package model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings({"serial", "unchecked"})
public abstract class BaseStu<M extends BaseStu<M>> extends Model<M> implements IBean {

	public M setSname(java.lang.String sname) {
		set("sname", sname);
		return (M)this;
	}
	
	public java.lang.String getSname() {
		return getStr("sname");
	}

	public M setName(java.lang.String name) {
		set("name", name);
		return (M)this;
	}
	
	public java.lang.String getName() {
		return getStr("name");
	}

	public M setStuID(java.lang.Integer stuID) {
		set("stuID", stuID);
		return (M)this;
	}
	
	public java.lang.Integer getStuID() {
		return getInt("stuID");
	}

	public M setPassword(java.lang.String password) {
		set("password", password);
		return (M)this;
	}
	
	public java.lang.String getPassword() {
		return getStr("password");
	}

	public M setGender(java.lang.String gender) {
		set("gender", gender);
		return (M)this;
	}
	
	public java.lang.String getGender() {
		return getStr("gender");
	}

	public M setTel(java.lang.String tel) {
		set("tel", tel);
		return (M)this;
	}
	
	public java.lang.String getTel() {
		return getStr("tel");
	}

	public M setEmail(java.lang.String email) {
		set("email", email);
		return (M)this;
	}
	
	public java.lang.String getEmail() {
		return getStr("email");
	}

	public M setDegree(java.lang.String degree) {
		set("degree", degree);
		return (M)this;
	}
	
	public java.lang.String getDegree() {
		return getStr("degree");
	}

	public M setUniversity(java.lang.String university) {
		set("university", university);
		return (M)this;
	}
	
	public java.lang.String getUniversity() {
		return getStr("university");
	}

	public M setMajor(java.lang.String major) {
		set("major", major);
		return (M)this;
	}
	
	public java.lang.String getMajor() {
		return getStr("major");
	}

	public M setIntroduction(java.lang.String introduction) {
		set("introduction", introduction);
		return (M)this;
	}
	
	public java.lang.String getIntroduction() {
		return getStr("introduction");
	}

	public M setResume(java.lang.String resume) {
		set("resume", resume);
		return (M)this;
	}
	
	public java.lang.String getResume() {
		return getStr("resume");
	}

}