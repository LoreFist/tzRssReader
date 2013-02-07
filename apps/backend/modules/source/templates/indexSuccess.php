<h1>Sources List</h1>

<table>
  <thead>
    <tr>
      <th>Id</th>
      <th>Title</th>
      <th>Description</th>
      <th>Link</th>
      <th>Author</th>
      <th>Language</th>
      <th>Created at</th>
    </tr>
  </thead>
  <tbody>
    <?php foreach ($sources as $source): ?>
    <tr>
      <td><a href="<?php echo url_for('source/edit?id='.$source->getId()) ?>"><?php echo $source->getId() ?></a></td>      
      <td><a href="<?php echo url_for('feed',array('id'=>$source->getId())) ?>"><?php echo $source->getTitle() ?></a></td>
      <td><?php echo $source->getDescription() ?></td>
      <td><?php echo $source->getLink() ?></td>
      <td><?php echo $source->getAuthor() ?></td>
      <td><?php echo $source->getLanguage() ?></td>
      <td><?php echo $source->getUpdatedAt() ?></td>
    </tr>
    <?php endforeach; ?>
  </tbody>
</table>

  <a href="<?php echo url_for('source/new') ?>">New</a>
