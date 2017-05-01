package com.baron.member.dao;
import java.util.List;

import com.baron.member.model.BookModel;
import com.baron.member.model.ContentModel;
import com.baron.member.model.MemberModel;

public interface JoinDao {
	public int selectMemberById(MemberModel model);

	public void insertMember(MemberModel memberModel);
	
	public MemberModel login(MemberModel memberModel);
	
	public MemberModel selectMember(String id);
	
	public String selectPass(String id);
	
	public void updateMember(MemberModel model);

	
	public int selectMaxGrade();


	public int selectMemberById(String id);

	public List<MemberModel> selectMemberList();

	public List<String> test();

}
