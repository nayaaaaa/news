package cn.lrw.newsssm.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.lrw.newsssm.dao.BaseDao;
import cn.lrw.newsssm.entity.Cmenu;

@Service
public class MenuSvc {
	@Resource
	private BaseDao<Cmenu> dao;
	public List<Cmenu> listMenu(int pid){
		return dao.list2(pid);
	}
}
