package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dao.BoardMybatisDao;
import model.Board;

@Controller
@RequestMapping("/board/")
public class BoardController {
	
	@Autowired 
	BoardMybatisDao bd;

	Model c;
	HttpSession session;
	HttpServletRequest request;
		
	@ModelAttribute
	void init(HttpServletRequest request, Model c) {
		this.request = request;
		this.c = c;
		session = request.getSession();
	}
		
	@RequestMapping("index")
	public String index() {
		System.out.println("request ok");
		request.setAttribute("name", "/board/*");
		return "/index"; 
	}

	@GetMapping("boardForm")
	public String boardForm() {

		System.out.println("board ok");
		return "/board/boardForm";
	}
	
	@PostMapping("boardPro")
	public String boardPro(@RequestParam("file2") MultipartFile multipartFile, Board board) {
		String path = request.getServletContext().getRealPath("/") + "view/board/img/";
		String filename = "";
		
		if (!multipartFile.isEmpty()) {
			File file = new File(path, multipartFile.getOriginalFilename());
			filename = multipartFile.getOriginalFilename();
			try {
				multipartFile.transferTo(file);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		board.setFile1(filename);
		
		String msg = "게시물 등록 실패";
		String url = "/board/boardForm";
		String boardid = (String) session.getAttribute("boardid"); 
		if (boardid == null)
			boardid = "1";
		board.setBoardid(boardid);
		System.out.println(board);
			int num = bd.insertBoard(board);
			if (num > 0) {
				msg = "게시물 등록 성공";
				url = "/board/boardList";
			}
			
		c.addAttribute("msg", msg);
		c.addAttribute("url", url);
		return "/alert";
	}
	
	@RequestMapping("boardList")
	public String boardList() {
		int limit = 10; 

		if (request.getParameter("boardid") != null) {
			session.setAttribute("pageNum","1"); 
			session.setAttribute("boardid", request.getParameter("boardid"));
		}

		String boardid = (String) session.getAttribute("boardid");
		if (boardid == null)
			boardid = "1";

		if (request.getParameter("pageNum") != null) {
			session.setAttribute("pageNum", request.getParameter("pageNum"));
		}
		String pageNum = (String) session.getAttribute("pageNum");
		if (pageNum == null)
			pageNum = "1";

		int pageInt = Integer.parseInt(pageNum); 
		
		String boardName = "";
		switch (boardid) {
		case "1":
			boardName = "배송문의";
			break;
		case "2":
			boardName = "고객의 소리";
			break;
		case "3":
			boardName = "입점문의";
			break;
		}

		int boardCount = bd.boardCount(boardid);
		List<Board> list = bd.boardList(boardid, pageInt, limit);

		int bottomLine = 3;
		int startPage = (pageInt-1)/bottomLine*bottomLine + 1;
		int endPage = startPage + bottomLine - 1;
		
		int maxPage = (boardCount/limit) + (boardCount%limit == 0? 0 : 1);
		
		if(maxPage < endPage) endPage = maxPage;
		
		c.addAttribute("boardCount", boardCount);
		c.addAttribute("list", list);
		c.addAttribute("boardName", boardName);
		c.addAttribute("boardid", boardid);
		c.addAttribute("pageInt", pageInt);
		c.addAttribute("startPage", startPage);
		c.addAttribute("endPage", endPage);
		c.addAttribute("bottomLine", bottomLine);
		c.addAttribute("maxPage", maxPage);
		
		return "/board/boardList";
	}

	@RequestMapping("boardInfo")
	public String boardInfo(int num) {
		Board board = bd.boardOne(num);
		c.addAttribute("board", board);
		return "/board/boardInfo";
	}

	@RequestMapping("replyForm")
	public String replyForm(int num) {
		
		Board board = bd.boardOne(num);
		String boardid = (String) session.getAttribute("boardid");
		if(boardid == null) boardid = "1";
		String boardName = "";
		switch(boardid) {
		case "1" : boardName = "공지사항"; break;
		case "2" : boardName = "자유게시판"; break;
		case "3" : boardName = "QnA"; break;
		}
		
		c.addAttribute("boardName", boardName);		
		c.addAttribute("board", board);
		return "/board/replyForm";
	}

	@RequestMapping("replyPro")
	public String replyPro(Board board) {
		
		String boardid = (String) session.getAttribute("boardid");
		if(boardid == null) boardid = "1";
		
		board.setFile1("");
		board.setBoardid(boardid);
		
		String msg = "답변 등록시 오류 발생";
		String url = "/board/replyForm?num=" + board.getNum();
		bd.refStepAdd(board.getRef(), board.getRefstep());
		
		board.setRef(board.getRef());	
		board.setReflevel(board.getReflevel() + 1); 
		board.setRefstep(board.getRefstep() + 1);	
		
		   
		if(bd.insertReply(board) > 0) {
			msg = "답변 등록 완료";
			url = "/board/boardList";
		};
		
		c.addAttribute("msg", msg);		
		c.addAttribute("url", url);
		return "/alert";
	}

	@RequestMapping("boardDeleteForm")
	public String boardDeleteForm(int num) {
		
		c.addAttribute("num", num);
		return "/board/boardDeleteForm";
	}
	
	@RequestMapping("boardDeletePro")
	public String memberDeletePro(int num, String pass) throws Exception  {
		
		Board board = bd.boardOne(num);
		String msg = "비밀번호가 틀렸습니다.";
		String url = "/board/boardDeleteForm?num=" + num;
			if (board.getPass().equals(pass)) { 
				if(bd.boardDelete(num,pass)>0){
				msg = "삭제 되었습니다";
				url = "/board/boardList";
				}
			}
		c.addAttribute("msg", msg);
		c.addAttribute("url", url);
		return "/alert";
	}
	
	@RequestMapping("boardUpdateForm")
	public String boardUpdateForm(int num) {
		Board board = bd.boardOne(num);
		c.addAttribute("board", board);
		return "/board/boardUpdateForm";
	}
	
	@RequestMapping("boardUpdatePro")
	public String boardUpdatePro(@RequestParam("f") MultipartFile multipartFile, Board board) {
		
		Board dbboard = bd.boardOne(board.getNum());
		
		String path = request.getServletContext().getRealPath("/") + "view/board/img/";
		
		if (!multipartFile.isEmpty()) {
			File file = new File(path, multipartFile.getOriginalFilename());
			String filename = multipartFile.getOriginalFilename();
			board.setFile1(filename);
			
			try {
				multipartFile.transferTo(file);
			} catch (IllegalStateException e) {
				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		} else {
			board.setFile1(dbboard.getFile1());
		}
		
		String msg = "비밀번호가 틀렸습니다.";
		String url = "/board/boardUpdateForm?num=" +board.getNum();
		
			if (board.getPass().equals(dbboard.getPass())) { 
				
				if(bd.boardUpdate(board)>0){
				msg = "수정 완료";
				url = "/board/boardInfo?num="+board.getNum();
				} else {
					msg = "수정 실패 ";
				}
			}
		c.addAttribute("msg", msg);
		c.addAttribute("url", url);
		return "/alert";
	}
}