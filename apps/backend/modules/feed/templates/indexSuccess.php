<h1>Feeds List</h1>

<table>
  <thead>
    <tr>
      <th>Id</th>
      <th>Title</th>
      <th>Link</th>
      <th>Description</th>
      <th>Author</th>
      <th>Created at</th>
      <th>Updated at</th>
    </tr>
  </thead>
  <tbody>
    <?php foreach ($feeds as $feed): ?>
    <tr>
      <td><a href="<?php echo url_for('feed/edit?id='.$feed->getId()) ?>"><?php echo $feed->getId() ?></a></td>      
      <td><?php echo $feed->getTitle() ?></td>
      <td><?php echo $feed->getLink() ?></td>
      <td><?php echo $feed->getDescription() ?></td>
      <td><?php echo $feed->getAuthor() ?></td>
      <td><?php echo $feed->getCreatedAt() ?></td>
      <td><?php echo $feed->getUpdatedAt() ?></td>
    </tr>
    <?php endforeach; ?>
  </tbody>
</table>

  <a href="<?php echo url_for('feed/new') ?>">New</a>
