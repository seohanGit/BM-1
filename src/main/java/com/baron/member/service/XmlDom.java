package com.baron.member.service;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import com.baron.member.model.BookModel;

public class XmlDom {
	public List<BookModel> XmlDom(InputStream br) throws Exception {
		List<BookModel> bookList = new ArrayList<BookModel>();
		
		// 팩토리 생성
		DocumentBuilderFactory dbfactory = DocumentBuilderFactory.newInstance();
		// 빌더 생성
		DocumentBuilder builder = dbfactory.newDocumentBuilder();
		// Document오브젝트 취득
		Document doc = builder.parse(new BufferedInputStream(br));
		// 루트의 자식 노드 취득
		Element root = doc.getDocumentElement();
		System.out.println("Root : " + root.getTagName());
		// 각노드의 리스트 취득
		NodeList list = root.getElementsByTagName("item");
		System.out.println("Node List Length : " + list.getLength());

		for (int i = 0; i < list.getLength(); i++ ) {
			BookModel model = new BookModel();
			
			Element element = (Element) list.item(i);
			model.setBookname(getChildren(element, "title"));
			model.setLink(getChildren(element, "link"));
			model.setImageurl(getChildren(element, "coverSmallUrl"));
			model.setPriceSales(getChildren(element, "priceSales"));
			model.setWriter(getChildren(element, "author"));
			model.setBooknum(getChildren(element, "isbn"));
			model.setGenre(getChildren(element, "categoryName"));
			model.setPublisher(getChildren(element, "publisher"));
			
			bookList.add(model);
			/*System.out.println("Time  : " + title);
			System.out.println("Code : " + link);
			System.out.println("writer : " + writer);
			System.out.println("imageUrl : " + imageurl);
			System.out.println("priceSales : " + priceSales);

			model.setBookname(title);
			model.setLink(link);
			model.setImageurl(imageurl);
			model.setPriceSales(priceSales);
			model.setWriter(writer);
			*/
		
			
			/*System.out.println(bookList.get(i).getBookname());
			System.out.println(bookList.get(i).getPriceSales());
			System.out.println(bookList.get(i).getWriter());
			*/
		}
/*
		System.out.println(bookList.get(0).getBookname());
		System.out.println(bookList.get(1).getBookname());
		System.out.println(bookList.get(2).getBookname());*/
		
		return bookList;
	}

	/**
	 * 지정한 엘레멘트의 값을 취득
	 * 
	 * @param element
	 *            Element명
	 * @param tagName
	 *            태그명
	 * @return 취득한 내용
	 */
	public static String getChildren(Element element, String tagName) {
		NodeList list = element.getElementsByTagName(tagName);
		Element cElement = (Element) list.item(0);

		if (cElement.getFirstChild() != null) {
			return cElement.getFirstChild().getNodeValue();
		} else {
			return "";
		}
	}

}