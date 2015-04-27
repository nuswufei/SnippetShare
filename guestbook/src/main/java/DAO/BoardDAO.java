package DAO;

import java.util.List;

import Entity.Board;

public interface BoardDAO {
	public boolean insert(Board board);
	public List<Board> findOwnBoard(String username);
}
