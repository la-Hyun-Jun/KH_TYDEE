package com.tydee.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.tydee.dao.MyTydeeDao;
import com.tydee.dto.MyTydeeDistinctDto;
import com.tydee.dto.MyTydeeDto;
import com.tydee.dto.UserInfoDto;

public class MyTydeeConvertToJson {
	public static String convertJson(UserInfoDto loginuser) {
		int user_no = loginuser.getUser_no();
		String user_nickname = loginuser.getUser_nickname();
		MyTydeeDao mtdao = new MyTydeeDao();
		List<MyTydeeDistinctDto> levels = mtdao.selectListDistinct(user_no);
		Map<String, Object> treeMap = new HashMap<String, Object>();
		List<Map<String, Object>> tempList = new ArrayList<Map<String,Object>>();
		
		for(MyTydeeDistinctDto level : levels) {
			int lev = level.getLev();
			int tiny_depth = level.getTiny_depth();
			List<MyTydeeDto> levelList = mtdao.selectListLevDepth(level);
			List<Map<String,Object>> itemList = new ArrayList<Map<String,Object>>();
			for(MyTydeeDto tiny : levelList) {
				System.out.println(tiny.getTiny_title());
				Map<String,Object> item = makeItem(tiny);
				itemList.add(item);
			}
			if (lev == 1) {
				treeMap.put("user_no", user_no);
				treeMap.put("user_nickname", user_nickname);
				treeMap.put("children", itemList);
			} else {
				Map<String,Object> tempMap = new HashMap<String,Object>();
				tempMap.putAll(treeMap);
				tempList = (List<Map<String,Object>>) tempMap.get("children");
				findDeeper(lev, tempList, tempMap, tiny_depth, itemList);
			}
		}
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(treeMap);
		return json;
	};
	
	public static Map<String,Object> makeItem(MyTydeeDto dto){
		Map<String,Object> item = new HashMap<String,Object>();
		item.put("tiny_no", dto.getTiny_no());
		item.put("tiny_title", dto.getTiny_title());
		item.put("tiy_depth", dto.getTiny_depth());
		item.put("tiny_content", dto.getTiny_content());
		item.put("tiny_image", dto.getTiny_image());
		item.put("tiny_regdate", dto.getTiny_regdate());
		item.put("value", 1);
		return item;
	}
	public static void findDeeper(int lev, List<Map<String,Object>> list, Map<String,Object> map, int tiny_depth, List<Map<String,Object>> itemList) {
		
	}
}
 