<?php

/**
 * feed form base class.
 *
 * @method feed getObject() Returns the current form's model object
 *
 * @package    rssreader
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BasefeedForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'          => new sfWidgetFormInputHidden(),
      'source_id'   => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('source'), 'add_empty' => false)),
      'title'       => new sfWidgetFormInputText(),
      'link'        => new sfWidgetFormTextarea(),
      'description' => new sfWidgetFormTextarea(),
      'author'      => new sfWidgetFormInputText(),
      'created_at'  => new sfWidgetFormDateTime(),
      'updated_at'  => new sfWidgetFormDateTime(),
    ));

    $this->setValidators(array(
      'id'          => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'source_id'   => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('source'))),
      'title'       => new sfValidatorString(array('max_length' => 255, 'required' => false)),
      'link'        => new sfValidatorString(array('max_length' => 4000, 'required' => false)),
      'description' => new sfValidatorString(array('max_length' => 4000, 'required' => false)),
      'author'      => new sfValidatorString(array('max_length' => 255, 'required' => false)),
      'created_at'  => new sfValidatorDateTime(),
      'updated_at'  => new sfValidatorDateTime(),
    ));

    $this->widgetSchema->setNameFormat('feed[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'feed';
  }

}
