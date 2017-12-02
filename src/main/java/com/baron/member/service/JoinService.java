package com.baron.member.service;

import java.util.List;

import com.baron.member.model.BookModel;
import com.baron.member.model.ContentModel;
import com.baron.member.model.MemberModel;

public interface JoinService {

	public boolean join(MemberModel memberModel);

	public MemberModel login(MemberModel memberModel);

	public String identify(String id);

	public void updateMember(MemberModel model);

	public int selectMaxGrade();

	public MemberModel selectMember(String id);
	
	public int selectMemberById(String id);

	public List<MemberModel> memberList(String rentdate);

	public List<String> test();
}
