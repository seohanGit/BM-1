package com.baron.member.dao;
import java.util.List;

import com.baron.member.model.BookModel;
import com.baron.member.model.ContentModel;
import com.baron.member.model.MemberModel;

public interface JoinDao {
	public int selectMemberById(MemberModel model);

	public void insertMember(MemberModel memberModel);

	public MemberModel selectMember(MemberModel model);
	
	public String selectPass(String id);
	
	public void updateMember(MemberModel model);

	public List<MemberModel> selectBlack();

	public List<MemberModel> selectLate();

	public List<MemberModel> selectBest();

	public int selectMaxGrade();

	public List<BookModel> selectBestBook();

	public int selectMemberById(String id);

	public List<MemberModel> selectMemberList();

	public List<String> test();

}
