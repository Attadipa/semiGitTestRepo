package com.kh.community.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;
import java.util.UUID;

import com.kh.common.PageVo;
import com.kh.community.repository.CommunityDao;
import com.kh.community.vo.AttachmentComVo;
import com.kh.community.vo.CommunityVo;
import com.kh.community.vo.TypeVo;

public class CommunityService {

	private final CommunityDao dao = new CommunityDao();

	public int getCount() {

		Connection conn = null;
		int result = 0;

		try {
			conn = getConnection();

			// dao 호출
			result = dao.getCount(conn);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}

		return result;
	}

	/*
	 * 게시글 리스트 조회 (현재 페이지에 보여질)
	 */
	public List<CommunityVo> selectList(PageVo pageVo, CommunityVo vo) {

		Connection conn = null;
		List<CommunityVo> voList = null;

		// 서비스 로직 작성 ㄴㄴ

		try {
			// dao 호출하기
			conn = getConnection();

			if (vo.getType() == null) {
				voList = dao.selectAllList(conn, pageVo);
			} else {
				voList = dao.selectList(conn, pageVo, vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 트랜잭션 처리
			close(conn);
		}

		// 실행결과 리턴
		return voList;
	}

	/*
	 * 카테고리 정보(리스트) 조회
	 */
	public List<TypeVo> selectTypeList() {

		Connection conn = getConnection();
		List<TypeVo> list = dao.selectTypeList(conn);
		close(conn);
		return list;
	}

	/*
	 * 원본 파일명을 중복되지않을 이름으로 변경
	 */
	public String createChangeName(String originName) {

		// 확장자 가져오기
		int dotIdx = originName.lastIndexOf(".");
		String ext = originName.substring(dotIdx);

		// 파일 이름 만들기
		long now = System.currentTimeMillis();
		String random = UUID.randomUUID().toString();
		random = random.substring(0, 8);

		String changeName = "ANBD_" + now + "_" + random + ext;

		return changeName;

	}

	/*
	 * 게시글 작성 (COMMUNITY 테이블 insert + ATTACHMEMNT_COM 테이블 insert)
	 */
	public int insertCommunity(CommunityVo cvo, AttachmentComVo avo) {

		// 데이터 검사
		// 제목이나 내용이 비어있으면 insert 안하기
		if (cvo.getTitle().length() < 1) {
			// 실패처리. 다음단계 진행X
			return -1;
		}

		if (cvo.getContent().length() < 1) {
			// 실패처리. 다음단계 진행X
			return -2;
		}
		Connection conn = getConnection();

		// DAO 호출
		int result1 = dao.insertCommunity(conn, cvo);

		int result2 = 1;
		if (avo != null) {
			result2 = dao.insertAttachment(conn, avo);
		}

		// 트랜잭션 처리
		if (result1 * result2 == 1) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result1 * result2;

	}

	public int increaseCommunity(String num) {

		Connection conn = null;
		int result = 0;

		try {
			conn = getConnection();

			result = dao.increaseCommunity(conn, num);

			if (result == 1) {
				commit(conn);
			} else {
				rollback(conn);
			}

		} catch (Exception e) {
			rollback(conn);
			e.printStackTrace();

		} finally {
			close(conn);
		}

		return result;
	}

	public CommunityVo selectOne(String num) {

		Connection conn = null;
		CommunityVo vo = null;

		try {
			conn = getConnection();
			vo = dao.selectOne(conn, num);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}

		return vo;
	}

	public int delete(String num) {

		Connection conn = null;
		int result = 0;

		try {
			conn = getConnection();
			result = dao.delete(conn, num);

			if (result == 1) {
				commit(conn);
			} else {
				rollback(conn);
			}

		} catch (Exception e) {
			rollback(conn);
			e.printStackTrace();

		} finally {
			close(conn);
		}

		return result;
	}

	public int edit(CommunityVo vo) {

		if (vo.getTitle().length() > 30) {
			System.out.println("제목이 30글자를 초과하였습니다.");
			return -1;
		}

		if (vo.getContent().length() > 500) {
			System.out.println("내용이 500글자를 초과하였습니다.");
			return -2;
		}

		Connection conn = null;
		int result = 0;

		try {
			conn = getConnection();

			result = dao.edit(conn, vo);

			if (result == 1) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} catch (Exception e) {
			rollback(conn);
			e.printStackTrace();

		} finally {
			close(conn);
		}

		return result;
	}

}
