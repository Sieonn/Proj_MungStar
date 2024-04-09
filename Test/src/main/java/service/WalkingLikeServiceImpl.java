package service;

import dao.WalkingLikeDAO;
import dao.WalkingLikeDAOImpl;

public class WalkingLikeServiceImpl implements WalkingLikeService{
   private WalkingLikeDAO walkingLikeDAO=new WalkingLikeDAOImpl();

   @Override
   public boolean walkingLike(String memId, Integer walkNum) throws Exception {
      Integer num=walkingLikeDAO.selectWalkingLike(memId, walkNum);
      if(num==null) return false;
      return true;
   }

   @Override
   public boolean togleWalkingLike(String memId, Integer walkNum) throws Exception {
      boolean isWalkingLike=walkingLike(memId, walkNum);
      if(isWalkingLike) {
         walkingLikeDAO.deleteWalkingLike(memId, walkNum);
         return false;
      } else {
         walkingLikeDAO.insertWalkingLike(memId, walkNum);
         return true;
      }
   }
}
