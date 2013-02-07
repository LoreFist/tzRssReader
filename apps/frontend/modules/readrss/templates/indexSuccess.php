
<h1>Recently Added RSS Feeds</h1>
 
<table width="100%">
  <tbody>
    <?php foreach ($pager as $feed): ?>
    <tr>      
      <td><?php echo $feed->getSource()->getTitle() ?></td>      
      <td><a href="<?php echo url_for('feed',array('id'=>$feed->getId())) ?>"><?php echo $feed->getTitle() ?></a></td>      
      <td><?php echo $feed->getUpdatedAt()?></td>
      <td width="1%"><?php echo link_to(" ", $feed->getLink(), 'target="_blank" class="feed"') ?></td>
    </tr>
   <?php endforeach; ?>
   <?php if (count($pager)==0): ?>
     <a href="backend.php">Добавить ленту</a>
   <?php endif; ?>   
     
  </tbody>
</table>
<?php include_partial('pager', array('pager'=>$pager))?>
<div class="pagination_desc">
    <strong><?php echo count($pager) ?></strong> Feeds in this Source

    <?php if ($pager->haveToPaginate()): ?>
      - page <strong><?php echo $pager->getPage() ?>/<?php echo $pager->getLastPage() ?></strong>
    <?php endif; ?>
</div>
