<?php

/**
 * source actions.
 *
 * @package    rssreader
 * @subpackage source
 * @author     Krishenko Timofey
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class sourceActions extends sfActions
{
  public function executeIndex(sfWebRequest $request)
  {
    $this->sources = Doctrine_Core::getTable('source')
      ->createQuery('a')
      ->execute();
  }

  public function executeNew(sfWebRequest $request)
  {
    $this->form = new sourceForm();
  }

  public function executeCreate(sfWebRequest $request)
  {
    $this->forward404Unless($request->isMethod(sfRequest::POST));

    $this->form = new sourceForm();

    $this->processForm($request, $this->form);

    $this->setTemplate('new');
  }

  public function executeEdit(sfWebRequest $request)
  {
    $this->forward404Unless($source = Doctrine_Core::getTable('source')->find(array($request->getParameter('id'))), sprintf('Object source does not exist (%s).', $request->getParameter('id')));
    $this->form = new sourceForm($source);
  }

  public function executeUpdate(sfWebRequest $request)
  {
    $this->forward404Unless($request->isMethod(sfRequest::POST) || $request->isMethod(sfRequest::PUT));
    $this->forward404Unless($source = Doctrine_Core::getTable('source')->find(array($request->getParameter('id'))), sprintf('Object source does not exist (%s).', $request->getParameter('id')));
    $this->form = new sourceForm($source);

    $this->processForm($request, $this->form);

    $this->setTemplate('edit');
  }

  public function executeDelete(sfWebRequest $request)
  {
    $request->checkCSRFProtection();

    $this->forward404Unless($source = Doctrine_Core::getTable('source')->find(array($request->getParameter('id'))), sprintf('Object source does not exist (%s).', $request->getParameter('id')));
    $source->delete();

    $this->redirect('source/index');
  }
 
  private function uniqSource($post){
    $source = Doctrine_Core::getTable('source')
                ->createQuery('a')
                ->where('a.link = ?', $post['link'])
                ->execute();
    if(count($source)>0) return false;
    else return true;
  }
  
  protected function processForm(sfWebRequest $request, sfForm $form)
  {
    $form->bind($request->getParameter($form->getName()), $request->getFiles($form->getName()));
    
    if ($form->isValid())
    {      
      if(!$this->uniqSource($request->getParameter($form->getName()))){
        echo 'not unique source';
      }
      else{
        $source = $form->save();
      }

      $this->redirect('source/index');
    }    
    
  }
}
