package model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings({"serial", "unchecked"})
public abstract class BaseWhereabouts<M extends BaseWhereabouts<M>> extends Model<M> implements IBean {

	public M setId(java.lang.Integer id) {
		set("id", id);
		return (M)this;
	}
	
	public java.lang.Integer getId() {
		return getInt("id");
	}

	public M setStuId(java.lang.Integer stuId) {
		set("stuId", stuId);
		return (M)this;
	}
	
	public java.lang.Integer getStuId() {
		return getInt("stuId");
	}

	public M setCompanyName(java.lang.String companyName) {
		set("companyName", companyName);
		return (M)this;
	}
	
	public java.lang.String getCompanyName() {
		return getStr("companyName");
	}

	public M setOccupation(java.lang.String Occupation) {
		set("Occupation", Occupation);
		return (M)this;
	}
	
	public java.lang.String getOccupation() {
		return getStr("Occupation");
	}

	public M setAddress(java.lang.String address) {
		set("address", address);
		return (M)this;
	}
	
	public java.lang.String getAddress() {
		return getStr("address");
	}

}
