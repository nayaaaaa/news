package cn.lrw.newsssm.web;

import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.lrw.newsssm.entity.User;
import cn.lrw.newsssm.service.UserSvc;
import cn.lrw.newsssm.utils.BaseUtil;

@Controller
@RequestMapping("/user")
public class UserAct{
	@Autowired
	private UserSvc userSvc;
	private HashMap<String,Object> jsonobj=new HashMap<String,Object>();
	@RequestMapping(value="/doLogin",method=RequestMethod.POST)
	public void doLogin(String uid,String pwd,HttpSession session,HttpServletResponse response,Model model){
		try{
			Long n=userSvc.getCount();
			if(n==1){
				User user=new User();
				user.setUid("123");
				user.setXm("zjh");
				user.setPwd(BaseUtil.lrwCode("123",""));
				user.setRole("1");
				userSvc.addU(user);
			}
			pwd=BaseUtil.lrwCode(pwd,"");
			User user0 = userSvc.findU(uid,pwd);
			jsonobj.clear();
			if(user0 != null){
				jsonobj.put("ok",true);
				jsonobj.put("msg","user/goIndex");
				session.setAttribute("me",user0);
			}else
			{
				jsonobj.put("ok", false);
				jsonobj.put("msg", "用户不存在");
			}
		}catch(Exception e){
			jsonobj.put("ok", false);
			jsonobj.put("msg","系统错误2-useract-dologin");
		}
		BaseUtil.outPrint(response,BaseUtil.toJson(jsonobj));
	}
	@RequestMapping(value="/doLogout",method=RequestMethod.GET)
	public String doLogout(HttpSession session){
		session.invalidate();
		return "redirect:/index.jsp";
	}
	@RequestMapping(value="/goIndex")
	public String goIndex(){
		return "/admin";
	}
}
