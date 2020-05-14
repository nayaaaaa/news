package cn.lrw.newsssm.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.lrw.newsssm.dao.BaseDao;
import cn.lrw.newsssm.entity.User;

@Service
public class UserSvc {
	@Resource
	private BaseDao<User> dao;
	public void addU(User user){
		dao.add1(user);
	}
	public User findU(String uid,String pwd){
		return dao.get2(uid, pwd);
	}
	public Long getCount(){
		return dao.countofUser();
	}
}
