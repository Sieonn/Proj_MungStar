package service;

import dao.FreeLikeDao;
import dao.FreeLikeDaoImpl;

public class BoardLikeServiceImpl implements BoardLikeService{
   private FreeLikeDao boardLikeDao=new FreeLikeDaoImpl();

   @Override
   public boolean boardLike(String memberId, Integer boardNum) throws Exception {
      Integer num=boardLikeDao.selectBoardLike(memberId, boardNum);
      if(num==null) return false;
      return true;
   }

   @Override
   public boolean togleBoardLike(String memberId, Integer boardNum) throws Exception {
      boolean isBoardLike=boardLike(memberId, boardNum);
      if(isBoardLike) {
         boardLikeDao.deleteBoardLike(memberId, boardNum);
         return false;
      } else {
         boardLikeDao.insertBoardLike(memberId, boardNum);
         return true;
      }
   }
}
