class User

  email: ''
  password: ''

  emailErrorMessage: 'Invalid email!'
  passwordErrorMessage: 'Password should have between 8 and 14 characters!'

  emailRegexp: /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
  passwordRegexp: /^\w{8,14}$/

  isValid: false
  isEmailValid: false
  isPasswordValid: false

  valid: ->
    @isValid = @validEmail() && @validPassword()

  validEmail: ->
    @isEmailValid = @emailRegexp.test(@email)

  validPassword: ->
    @isPasswordValid = @passwordRegexp.test(@password)

  set: (key, value) ->
    @[key] = value
    @valid()


class FormView

  constructor: ->
    @user = new User

    @$emailInput = $('#user_email')
    @$passowrdInput = $('#user_password')
    @$submitBtn = $('.btn-submit')

    @$emailInput.on('change', $.proxy(@setValues, this))
    @$passowrdInput.on('change', $.proxy(@setValues, this))

    @$emailInput.on('change', $.proxy(@render, this))
    @$passowrdInput.on('change', $.proxy(@render, this))

    @setValues()
    @render()

  setValues: ->
    @user.set 'email', @$emailInput.val()
    @user.set 'password', @$passowrdInput.val()

  render: ->
    if @user.isEmailValid || !@user.email
      @removeEmailError()
    else
      @addEmailError()

    if @user.isPasswordValid || !@user.password
      @removePasswordError()
    else
      @addPasswordError()

    if @user.isValid
      @$submitBtn.removeClass('not-allowed')
      @$submitBtn.removeAttr('disabled')
    else
      @$submitBtn.addClass('not-allowed')
      @$submitBtn.attr('disabled', 'disabled')


  addEmailError: ->
    @$emailInput.closest('.field').children().last().text(@user.emailErrorMessage)
    @$emailInput.addClass('input-error')

  removeEmailError: ->
    @$emailInput.closest('.field').children().last().text('')
    @$emailInput.removeClass('input-error')

  addPasswordError: ->
    @$passowrdInput.closest('.field').children().last().text(@user.passwordErrorMessage)
    @$passowrdInput.addClass('input-error')

  removePasswordError: ->
    @$passowrdInput.closest('.field').children().last().text('')
    @$passowrdInput.removeClass('input-error')


new FormView