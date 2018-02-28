$ ->
  printAlertMessage = (data, type = 'info') ->
    if $('#flash_name').length
      $('#flash_name').replaceWith "<div id='flash_name' class='alert-box " + type + "'>" + data.message + "<a class='close'>x</a></div>"
    else
      $('#header-block').after "<div id='flash_name' class='alert-box " + type + "'>" + data.message + "<a class='close'>x</a></div>"
    false
  $(document).ready ->
    $('.classes-take-class, .cancel-class').on 'ajax:before', (xhr, settings) ->
      $(xhr.target).hide()
      true

    $('.classes-take-class, .cancel-class').on 'ajax:error', (xhr, settings) ->
      xhr.preventDefault();
      $(xhr.target).show()
      printAlertMessage(data, 'error')
      false

    $('.classes-take-class').on 'ajax:success', (xhr, data, status) ->
      xhr.preventDefault();
      cancel_link = $('<a/>', 
        html: 'Cancel'
        href: '/classes/cancel.json?klass_id=' + data.klass
        'data-remote': true
        'data-method': 'post'
        'rel': 'nofollow'
        'class': 'button radius cancel-class' )
        
      $(xhr.target).replaceWith cancel_link
      printAlertMessage(data, 'success')
      true

    $('.cancel-class').on 'ajax:success', (xhr, data, status) ->
      xhr.preventDefault();
      $(xhr.target).replaceWith '<span style="font-weight: 800;">Canceled</span>'
      printAlertMessage(data, 'success')
      true

#    offset = 250
#    duration = 300
#    $(window).scroll ->
#      if $(this).scrollTop() > offset
#        $('.back-to-top').show()
#      else
#        $('.back-to-top').hide()
#    $('.back-to-top').click (event) ->
#      event.preventDefault()
#      $('html, body').animate { scrollTop: 0 }, duration
#      false