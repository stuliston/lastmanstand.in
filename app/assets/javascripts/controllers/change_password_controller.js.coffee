LMS.ChangePasswordController = Ember.ObjectController.extend

  needs: ['currentUser', 'signIn']

  errors: null
  isSaving: false
  isSaved: false

  isPasswordLongEnough: (->
    @get('password')?.length >= 5
  ).property('password')

  isPasswordConfirmed: (->
    @get('password') == @get('passwordConfirmation')
  ).property('password', 'passwordConfirmation')

  isValid: Ember.computed.and('isPasswordLongEnough', 'isPasswordConfirmed')
  isInvalid: Ember.computed.not('isValid')
  isDisabled: Ember.computed.or('isInvalid', 'isSaving')

  actions:
    changePassword: ->
      return if @get('isInvalid')
      @set('isSaving', true)
      data =
        user:
          reset_password_token: @get('model.resetPasswordToken')
          password: @get('model.password')
          password_confirmation: @get('model.passwordConfirmation')

      $.ajax('/users/password', {
        type: 'PUT'
        data: data
        dataType: 'json'
      }).done((response) =>
        @transitionToRoute('index')
      ).fail((response) =>
        @set('errors', @_parseErrors(response.responseJSON.errors))
      ).always( =>
        @set('isSaving', false)
      )

    cancel: ->
      @transitionToRoute('index')

  _parseErrors: (errorsObj) ->
    errors = []
    for key, value of errorsObj
      errors.push("#{key} #{value[0]}")
    errors