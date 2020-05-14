package cn.lrw.newsssm.web;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.lrw.newsssm.entity.News;
import cn.lrw.newsssm.service.NewsSvc;
import cn.lrw.newsssm.utils.BaseUtil;

@Controller
@RequestMapping("/news")
public class NewsAct {
    @Autowired
    private NewsSvc newsSvc;
    private String jsonResult;
    private  HashMap<String,Object> jsonobj=new HashMap<String,Object>();
    @RequestMapping(value="/goAdd")
    public String goAdd(){
        return "/newsadd";
    }
    @RequestMapping(value="/saveAdd",method=RequestMethod.POST)
    public void savaAdd(News news, HttpServletResponse response){
        jsonobj.clear();
        try {
            news.setTjdate(new Date());
            news.setHitnum(0);
            newsSvc.addNews(news);
            jsonobj.put("ok", true);
            jsonobj.put("msg","goadmin");
        } catch ( Exception e) {
            //TODO: handle exception
            e.printStackTrace();
            jsonobj.put("ok", false);
            jsonobj.put("msg", "系统错误-NewsAct-saveadd");
        }
        jsonResult = BaseUtil.toJson(jsonobj);
        BaseUtil.outPrint(response,jsonResult);
    }
    
    @RequestMapping(value="/doDell",method=RequestMethod.POST)
    public void doDell( int id, HttpServletResponse response){
        jsonobj.clear();
        boolean delflag=false;
        try{
            newsSvc.deleteNews(id);
            delflag=true;
        } catch(Exception e) {
            //TODO: handle exception
            e.printStackTrace();
            delflag=false;
        }
        jsonobj.put("delflag", delflag);
        BaseUtil.outPrint(response,BaseUtil.toJson(jsonobj));
    }
    
    @RequestMapping(value="/goEdit",method=RequestMethod.GET)
    public String goEdit(int id,Model model){
        model.addAttribute("news",newsSvc.getNews(id));
        return "/newsedit";
    }
    @RequestMapping(value="/saveEdit",method=RequestMethod.POST)
    public void saveEdit(News news,HttpServletResponse response){
        jsonobj.clear();
        try {
            News news0=newsSvc.getNews(news.getId());
            news0.setContent(news.getContent());
            news0.setCruser(news.getCruser());
            news0.setTitle(news.getTitle());
            newsSvc.updateNews(news0);
            jsonobj.put("ok", true);
            jsonobj.put("msg", "goadmin");
        } catch (Exception e) {
            //TODO: handle exception
            e.printStackTrace();
            jsonobj.put("ok", false);
            jsonobj.put("msg", "系统错误2");
        }
        jsonResult = BaseUtil.toJson(jsonobj);
        BaseUtil.outPrint(response,jsonResult);
    }
    @RequestMapping(value="/goList")
    public String goList(){
        return "/newslist";
    }
    @RequestMapping(value="/getCount",method=RequestMethod.POST)
    public void getCount(HttpServletResponse response){
        int c=0;
        try {
            c=newsSvc.getNewsCount();
        } catch (Exception e) {
            //TODO: handle exception
            e.printStackTrace();
            c=0;
        }
        jsonobj.clear();
        jsonobj.put("newscount",c);
        jsonResult = BaseUtil.toJson(jsonobj);
        BaseUtil.outPrint(response,jsonResult);
    }
    @RequestMapping(value="/getaNews",method=RequestMethod.GET)
    public String getaNews(int id,Model model){
        model.addAttribute("news",newsSvc.getNews(id));
        return "/newsread";
    }
    @RequestMapping(value="/listNews",method=RequestMethod.POST)
    public void listNews(String s_name,int page,int rows,HttpServletResponse response){
        List<News> newslist = newsSvc.listDgNews(s_name,page,rows);
        jsonobj.clear();
        jsonobj.put("total",newslist.size());
        jsonobj.put("rows",newslist);
        jsonResult = BaseUtil.toJson(jsonobj);
        BaseUtil.outPrint(response,jsonResult);
    }
}
