<?php

/**
 * source form.
 *
 * @package    rssreader
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormTemplate.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class sourceForm extends BasesourceForm
{
  public function configure()
  {
    unset($this['created_at'], $this['updated_at']);
   /* $this->setWidgets(array(
      'link'=> new sfWidgetFormInputText(),
    ));*/
    /*$this->setValidators(array(
      'link'=> new sfValidatorUrl(),
    ));*/
  }
}
