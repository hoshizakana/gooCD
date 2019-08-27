
$('#items').append("<%= escape_javascript(render 'products-item', object: @product) %>")
$("#more_link").replaceWith("<%= escape_javascript(
  link_to_next_page @product, 'more', remote: true, id: 'more_link')
) %>");
