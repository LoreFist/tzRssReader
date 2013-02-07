<?php

/**
 * readrss actions.
 *
 * @package    rssreader
 * @subpackage readrss
 * @author     Krishenko Timofey
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class readrssActions extends sfActions
{
 /**
  * Query feeds and left join sources
  * @param sfRequest $request A request object
  */
  public function executeIndex(sfWebRequest $request)
  { 
    $feeds = Doctrine::getTable('feed')
      ->createQuery('a')
      ->leftJoin('a.source');      
    
    $this->pager = new sfDoctrinePager('feeds',20);
    $this->pager->setQuery($feeds);
    $this->pager->setPage($request->getParameter('page', 1));
    $this->pager->init();
  }
  
  /**
   * query feed 
   * @param sfWebRequest $request
   */
  public function executeFeed(sfWebRequest $request){
    $feed = Doctrine_Core::getTable('feed')->findOneById(array($request->getParameter('id')));
    $this->forward404Unless($feed, sprintf('Object feed does not exist (%s).', $request->getParameter('id')));
    $this->feed = $feed; 
  }
}
  