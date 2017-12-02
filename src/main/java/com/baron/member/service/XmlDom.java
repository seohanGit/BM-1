package com.baron.member.service;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.baron.member.model.BookModel;

public class XmlDom {
	/*
	 * public NodeList responseField(InputStream br) throws Exception{
	 * 
	 * Element root = makeDoc(br);
	 * 
	 * NodeList result; result. root.getElementsByTagName("totalResults");
	 * NodeList page = root.getElementsByTagName("startIndex");
	 * 
	 * 
	 * return page; }
	 */

	private String getCategoryName(String string) {
		String categoryName;
		switch (string) {
		case "300":
			categoryName = "E-기타매체";
			break;
		case "400":
			categoryName = "E-기타매체";
			break;
		case "107":
			categoryName = "J-정기간행물";
			break;
		case "209":
			categoryName = "J-정기간행물";
			break;
		case "115":
			categoryName = "S-규격/사전";
			break;
		case "203":
			categoryName = "S-규격/사전";
			break;

		case "125":
			categoryName = "T-논문";

			break;
		default:
			categoryName = "B-도서(단행본)";
			break;
		}
		return categoryName;

	}

	private Element makeDoc(InputStream br)
			throws ParserConfigurationException, SAXException, IOException {
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
		return root;
	}

	public BookModel getBook(InputStream br) throws Exception, SAXException,
			IOException {
		Element root = makeDoc(br);
		int totalResults = Integer.parseInt(getChildren(root, "totalResults"));

		NodeList list = root.getElementsByTagName("item");

		BookModel book = new BookModel();
		for (int i = 0; i < list.getLength(); i++) {
			book.setTotalResults(totalResults);

			Element element = (Element) list.item(0);
			book.setTitle(getChildren(element, "title").replace("'",""));
			book.setLink(getChildren(element, "link"));
			book.setImageurl(getChildren(element, "coverSmallUrl"));
			book.setPrice(Integer.parseInt(getChildren(element, "priceSales")));
			book.setAuthor(getChildren(element, "author").replace("'",""));
			book.setIsbn(getChildren(element, "isbn"));
			book.setB_group(getCategoryName(getChildren(element, "categoryId")));
			book.setPublish(getChildren(element, "publisher").replace("'",""));
			book.setSummary(getChildren(element, "description").replace("‘","").replace("’", ""));
			System.out.println(getChildren(element, "description"));
			 
		}
		if (list.getLength() == 0 ){
			book.setTitle("");
		}
		return book;
	}

	public List<BookModel> getBooklist(InputStream br) throws Exception,
			SAXException, IOException {
		Element root = makeDoc(br);
		int totalResults = Integer.parseInt(getChildren(root, "totalResults"));

		String keyword = getChildren(root, "query");
		NodeList list = root.getElementsByTagName("item");
		List<BookModel> bookList = new ArrayList<BookModel>();

		for (int i = 0; i < list.getLength(); i++) {
			BookModel book = new BookModel();

			Element element = (Element) list.item(i);
			//book.setKeyword(keyword);
			book.setTotalResults(totalResults);

			book.setTitle(getChildren(element, "title"));
			book.setLink(getChildren(element, "link"));
			book.setImageurl(getChildren(element, "coverSmallUrl"));
			book.setPrice(Integer.parseInt(getChildren(element, "priceSales")));
			book.setAuthor(getChildren(element, "author"));
			book.setIsbn(getChildren(element, "isbn"));
			book.setB_group(getCategoryName(getChildren(element, "categoryId")));
			book.setPublish(getChildren(element, "publisher"));
			book.setSummary(getChildren(element, "description"));

			bookList.add(book);

		}

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