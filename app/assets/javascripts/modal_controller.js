function renderModal(html, selector, title, body) {
  var $modal = $('.' + selector);

  if ($modal.length === 0) {
    $modal = $(html);
    $modal.addClass(selector)
  }

  if (title) $modal.find('.modal-header h4').text(title);
  if (body) $modal.find('.modal-body').html(body);

  $modal.on('hidden.bs.modal', function() {
    $(this).remove();
  });

  $('body').append($modal);

  $modal.modal('show');
}
