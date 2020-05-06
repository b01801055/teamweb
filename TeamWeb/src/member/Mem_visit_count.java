package member;

import java.io.Serializable;

import conn.ConnQuery;
import conn.ConnUpdate;

public class Mem_visit_count implements Serializable {
	private static final long serialVersionUID = 1L;
	private int viewId;
	private String viewIp="";
	private int viewN;
	public void setViewId(int viewId){this.viewId=viewId;}
	public void setViewId(String viewId){this.viewId=Integer.parseInt(viewId);}
	public void setViewIp(String viewIp){
		if(!this.viewIp.equals(viewIp)) {//如果IP第一次進來
			this.viewIp=viewIp;
			//插入一筆訪問
			String sql=String.format("INSERT INTO TEAMWEB2020.VIEWCOUNT(VIEW_ID,VIEW_TIME,VIEW_IP) VALUES(%d,NOW(),'%s');",viewId,viewIp);
			ConnUpdate cu = new ConnUpdate();
			cu.setSql(sql);
		}
	}
	public void setViewN(int n) {
		//查詢現在共有幾筆
		ConnQuery cq = new ConnQuery(); 
		cq.setSql("SELECT * FROM TEAMWEB2020.VIEWCOUNT;");
		this.viewN = cq.getQuery_count();
	}
	public int getViewN() {
		//查詢現在共有幾筆
				ConnQuery cq = new ConnQuery(); 
				cq.setSql("SELECT * FROM TEAMWEB2020.VIEWCOUNT;");
				this.viewN = cq.getQuery_count();
		return this.viewN;
	}
	
}//class
