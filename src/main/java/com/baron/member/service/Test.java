package com.baron.member.service;

import java.util.Hashtable;

import javax.naming.Context;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.Attributes;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;

public class Test {
	private static String userId = "test";
	private static String passwd = "pass";
	private static String ldapDomain = "ds.mycompany.com";
	private static String ldapPathFormat = "LDAP://%s/";

	public static void main(String[] args) {
		String path = String.format(ldapPathFormat, ldapDomain);
		System.out.println(path);

		String filterString = "(cn=mrtint)";

		// LDAP Context
		DirContext context = null;

		// LDAP ���� ȯ�� ����
		Hashtable<String, String> properties = new Hashtable<String, String>();
		properties.put(Context.INITIAL_CONTEXT_FACTORY,
				"com.sun.jndi.ldap.LdapCtxFactory");
		properties.put(Context.PROVIDER_URL, path);
		properties.put(Context.SECURITY_AUTHENTICATION, "simple");
		properties.put(Context.SECURITY_PRINCIPAL, userId);
		properties.put(Context.SECURITY_CREDENTIALS, passwd);

		try {
			context = new InitialDirContext(properties);
			SearchControls searcher = new SearchControls();
			// �⺻ ��Ʈ������ �����ؼ� �������� �ϴ°���.
			searcher.setSearchScope(SearchControls.SUBTREE_SCOPE);
			NamingEnumeration<SearchResult> results = context.search(
					"OU=Employee,DC=ds,DC=mycompany,DC=com", filterString, searcher);
			while (results.hasMore()) {
				SearchResult result = results.next();
				Attributes attrs = result.getAttributes();
				System.out.println(attrs.get("displayName"));
			}
		} catch (NamingException e) {
			e.printStackTrace();
		}

		System.out.println(isAuthenticatedUser("mrtint@ds.mycompany.com",
				"test123"));

	}

	/**
	 * LDAP ������ ��ȣ�� �̿��� ����� ����
	 * 
	 * @param userId
	 *            ������
	 * @param password
	 *            ��ȣ
	 * @return ���� ���� (ID / PASS �� ��ġ�ϴ��� �ƴ����� Ȯ����)
	 */
	public static boolean isAuthenticatedUser(String userId, String password) {
		boolean isAuthenticated = false;
		String path = String.format(ldapPathFormat, ldapDomain);
		if (password != null && password != "") {
			Hashtable<String, String> properties = new Hashtable<String, String>();
			properties.put(Context.INITIAL_CONTEXT_FACTORY,
					"com.sun.jndi.ldap.LdapCtxFactory");
			properties.put(Context.PROVIDER_URL, path);
			properties.put(Context.SECURITY_AUTHENTICATION, "simple");
			properties.put(Context.SECURITY_PRINCIPAL, userId);
			properties.put(Context.SECURITY_CREDENTIALS, password);
			try {
				DirContext con = new InitialDirContext(properties);
				isAuthenticated = true;
				con.close();
			} catch (NamingException e) {
			}
		}
		return isAuthenticated;
	}
}
