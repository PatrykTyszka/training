emailInput = $('#user_email')
passowrdInput = $('#user_password')

emailInput.focus ->
  $(@).removeClass('input-error')
  $(@).addClass('input-focus')
  $(@).val('')
  $(@).removeClass('input-ok')

emailInput.focusout ->
  errorMessage = $(@).closest('.field').children().last()
  $(@).removeClass('input-focus')
  value = $(@).val()
  regexp = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
  if regexp.test(value)
    $(@).removeClass('input-error')
    errorMessage.text('')
    $(@).addClass('input-ok')
    if $('.input-ok').length == 2
      submitButton = $('.btn-submit')
      submitButton.removeClass('not-allowed')
      submitButton.removeAttr('disabled')
  else
    $(@).removeClass('input-ok')
    $(@).addClass('input-error')
    errorMessage.text('Invalid email!')


passowrdInput.focus ->
  $(@).removeClass('input-error')
  $(@).addClass('input-focus')
  $(@).val('')
  $(@).removeClass('input-ok')

passowrdInput.focusout ->
  errorMessage = $(@).closest('.field').children().last()
  $(@).removeClass('input-focus')
  value = $(@).val()
  regexp = /^[a-zA-Z]\w{8,14}$/
  if regexp.test(value)
    $(@).addClass('input-ok')
    $(@).removeClass('input-error')
    errorMessage.text('')
    console.log $('.input-ok').length
    if $('.input-ok').length == 2
      submitButton = $('.btn-submit')
      $('.btn-submit').removeClass('not-allowed')
      submitButton.removeAttr('disabled')
  else
    $(@).removeClass('input-ok')
    $(@).addClass('input-error')
    errorMessage.text('Password should have between 8 and 14 characters!')



