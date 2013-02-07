<h1><?php echo $feed->getTitle()?><?php echo link_to(" ", $feed->getSource()->getLink(), 'target="_blank" class="feed"') ?></h1>
<h3>
  <?php echo $feed->getAuthor() ?>
</h3>
<table width="100%">
  <tbody>
    <tr>
      <td><?php echo ($feed->getDescription(ESC_RAW)) ?></td> 
    </tr>
    <tr>
      <td><?php echo link_to("link", $feed->getLink()) ?> </td>
    </tr>
  </tbody>
</table>