package com.tydee.utils;

import java.io.FileWriter;
import java.io.IOException;

public class JsonWriter {
	public static void makeJsonFile(String jsonobj) {
		FileWriter file = null;
		try {
			file = new FileWriter("D:\\Documents\\KH_TYDEE\\MyTydee\\WebContent\\json\\nowloading.json");
			file.write(jsonobj);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				file.flush();
				file.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
