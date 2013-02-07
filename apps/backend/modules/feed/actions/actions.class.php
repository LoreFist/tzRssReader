<?php

/**
 * feed actions.
 *
 * @package    rssreader
 * @subpackage feed
 * @author     Krishenko Timofey
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class feedActions extends sfActions
{
  public function executeIndex(sfWebRequest $request)
  {
    $this->forward404Unless($feeds = Doctrine_Core::getTable('feed')->findBySourceId(array($request->getParameter('id'))), sprintf('Object feed does not exist (%s).', $request->getParameter('id')));
    $this->feeds = $feeds;
  }

  public function executeCreate(sfWebRequest $request)
  {
    $this->forward404Unless($request->isMethod(sfRequest::POST));

    $this->form = new feedForm();

    $this->processForm($request, $this->form);

    $this->setTemplate('new');
  }

  public function executeEdit(sfWebRequest $request)
  {
    $this->forward404Unless($feed = Doctrine_Core::getTable('feed')->find(array($request->getParameter('id'))), sprintf('Object feed does not exist (%s).', $request->getParameter('id')));
    $this->form = new feedForm($feed);
  }

  public function executeUpdate(sfWebRequest $request)
  {
    $this->forward404Unless($request->isMethod(sfRequest::POST) || $request->isMethod(sfRequest::PUT));
    $this->forward404Unless($feed = Doctrine_Core::getTable('feed')->find(array($request->getParameter('id'))), sprintf('Object feed does not exist (%s).', $request->getParameter('id')));
    $this->form = new feedForm($feed);

    $this->processForm($request, $this->form);

    $this->setTemplate('edit');
  }

  public function executeDelete(sfWebRequest $request)
  {
    $request->checkCSRFProtection();

    $this->forward404Unless($feed = Doctrine_Core::getTable('feed')->find(array($request->getParameter('id'))), sprintf('Object feed does not exist (%s).', $request->getParameter('id')));
    $feed->delete();

    $this->redirect('feed/index');
  }

  protected function processForm(sfWebRequest $request, sfForm $form)
  {
    $form->bind($request->getParameter($form->getName()), $request->getFiles($form->getName()));
    if ($form->isValid())
    {
      $feed = $form->save();

      $this->redirect('feed/edit?id='.$feed->getId());
    }
  }
}
