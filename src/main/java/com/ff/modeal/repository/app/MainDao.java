package com.ff.modeal.repository.app;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<Map<String, Object>> mainList(String latitude, String longitude, Double doubleRange){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("latitude", latitude);
		map.put("longitude", longitude);
		map.put("range", doubleRange);
		System.out.println(map);
		System.out.println(sqlSession.selectList("item.mainList", map));
		return sqlSession.selectList("item.mainList", map);
	}
	
	public void addBookmark(Long itemNo, Long userNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("itemNo", itemNo);
		map.put("userNo", userNo);
		sqlSession.insert("bookmark.add", map);
	}
	
	public void deleteBookmark(Long itemNo, Long userNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("itemNo", itemNo);
		map.put("userNo", userNo);
		sqlSession.delete("bookmark.delete", map);
	}
	
	public Long selectBookmark(Long itemNo, Long userNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("itemNo", itemNo);
		map.put("userNo", userNo);
		return sqlSession.selectOne("bookmark.select", map);
	}
}
