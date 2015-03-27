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

public class XmlDom {
	public List<String> XmlDom(InputStream br) throws Exception {
		List<String> info = new ArrayList<String>();
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

		for (int i = 0; i < list.getLength(); i++) {
			Element element = (Element) list.item(i);
			String title = getChildren(element, "title");
			String link = getChildren(element, "link");
			String imageurl = getChildren(element, "coverSmallUrl");
			String priceSales = getChildren(element, "priceSales");
			String writer = getChildren(element, "author");

			System.out.println("Time  : " + title);
			System.out.println("Code : " + link);
			System.out.println("writer : " + writer);
			System.out.println("imageUrl : " + imageurl);
			System.out.println("priceSales : " + priceSales);

			info.add(title);
			info.add(link);
			info.add(imageurl);
			info.add(priceSales);
			info.add(writer);

		}
		return info;
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