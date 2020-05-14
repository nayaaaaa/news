package cn.lrw.newsssm.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BaseDao<T> {
	public int add1(T o);
	public int add2(T o);
	public void delete(T o);
	public void update(T o);
	public T get1(@Param("id")int id);
	public T get2(@Param("s1")String s1,@Param("s2")String s2);
	public List<T>list1();
	public List<T>list2(@Param("id")int pid);
	public List<T>list3(@Param("offset")int page,@Param("rows")int rows);
	public List<T>list4(@Param("s1")String s1,@Param("offset")int offset,@Param("rows")int rows);
	public Long countofUser();
	public Long countofNews();
}
