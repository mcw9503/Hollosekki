package kh.finalproj.hollosekki.enroll.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproj.hollosekki.enroll.model.dao.EnrollDAO;
import kh.finalproj.hollosekki.enroll.model.vo.Users;

@Service
public class EnrollServiceImpl implements EnrollService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private EnrollDAO eDAO;

	@Override
	public int insertUser(Users u) {
		return eDAO.insertUser(sqlSession, u);
	}

	@Override
	public Users login(Users u) {
		return eDAO.login(sqlSession, u);
	}
}