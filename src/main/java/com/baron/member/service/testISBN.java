//package com.baron.member.service;
//
//import java.io.BufferedReader;
//import java.io.IOException;
//import java.io.InputStreamReader;
//import java.io.UnsupportedEncodingException;
//import java.net.MalformedURLException;
//import java.net.URL;
//import java.net.URLEncoder;
//
//import com.baron.member.model.BookModel;
//
//public class testISBN {
//
//	public static void main(String[] args) throws Exception {
//
//		String isbn = "9992013090603";
//		BookModel book = new BookModel();
//		URL url = getIsbnUrl(isbn);
//
//		getApiTest(url);
//
//		XmlDom xmlDom = new XmlDom();
//		book = xmlDom.getBook(url.openStream());
//		System.out.println(isbn);
//
//	}
//
//	private static URL getIsbnUrl(String keyword)
//			throws UnsupportedEncodingException, MalformedURLException {
//		String key = "B0F933E2847C6447203572CCC68F824A1054E7EF0D966C7B95245288CE95E300";
//		String addr = "http://book.interpark.com/api/search.api?";
//		String parameter = "";
//
//		key = URLEncoder.encode(key, "UTF-8");
//		parameter = parameter + "&" + "query=" + keyword;
//		parameter = parameter + "&" + "queryType=isbn";
//		parameter = parameter + "&" + "maxResults=1";
//		parameter = parameter + "&" + "searchTarget=book";
//		parameter = parameter + "&" + "sort=salesPoint";
//
//		key = URLEncoder.encode(key, "UTF-8");
//		addr = addr + "key=" + key + parameter;
//
//		URL url = new URL(addr);
//		return url;
//
//	}
//
//	private static void getApiTest(URL url) {
//		BufferedReader br;
//		/* api 출력 확인 */
//		br = new BufferedReader(new InputStreamReader(url.openStream()));
//
//		String line;
//		StringBuilder sBuffer = new StringBuilder();
//
//		while ((line = br.readLine()) != null) {
//			sBuffer.append(line);
//			System.out.println(line);
//		}
//
//		br.close();
//	}
//}
