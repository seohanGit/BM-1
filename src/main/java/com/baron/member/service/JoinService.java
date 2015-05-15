package com.baron.member.service;

import java.util.List;

import com.baron.member.model.BookModel;
import com.baron.member.model.ContentModel;
import com.baron.member.model.MemberModel;

public interface JoinService {

	public boolean join(MemberModel memberModel);

	public MemberModel login(String id);

	public String identify(String id);

	public void updateMember(MemberModel model);

	public List<MemberModel> selectBest();

	public int selectMaxGrade();

	public List<BookModel> selectBestBook();

	public int selectMemberById(String id);

	public List<MemberModel> memberList();

	public List<String> test();
}
