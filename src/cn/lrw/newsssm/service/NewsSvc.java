package cn.lrw.newsssm.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.lrw.newsssm.dao.BaseDao;
import cn.lrw.newsssm.entity.News;

@Service
public class NewsSvc {
	@Resource
	public BaseDao<News> dao;
	public void addNews(News news) throws Exception{
		dao.add2(news);
	}
	public void deleteNews(int id) throws Exception{
		News u = (News)dao.get1(id);
		dao.delete(u);
	}
	public void updateNews(News news) throws Exception{
		dao.update(news);
	}
	public List<News> listDgNews(String title,int page,int rows){
		if(page<1){
			page=1;
		}
		if(rows<1){
			rows=10;
		}
		page=(page-1)*rows;
		if(title == null||"".equals(title))
			return dao.list3(page, rows);
		else return dao.list4(title, page, rows);
	}
	public News getNews(int id){
		News news=dao.get1(id);
		news.setHitnum(news.getHitnum()+1);//点击量增加
		dao.update(news);
		return news;
	}
	public int getNewsCount(){
		try{
			Long a=dao.countofNews();
			return Integer.parseInt(a.toString());
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}
}
