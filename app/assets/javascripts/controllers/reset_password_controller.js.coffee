LMS.ResetPasswordController = Ember.ObjectController.extend

  needs: ['currentUser', 'signIn']

  errors: null
  isSaving: false
  isSaved: false

  isEmailValid: (->
    LMS.EmailValidator.isValid(@get('email'))
  ).property('email')

  isInvalid: Ember.computed.not('isEmailValid')
  isDisabled: Ember.computed.or('isInvalid', 'isSaving')

  actions:
    resetPassword: ->
      return if @get('isInvalid')
      @set('isSaving', true)
      data =
        user:
          email: @get('model.email')

      $.ajax('/users/password', {
        type: 'POST'
        data: data
        dataType: 'json'
      }).done((response) =>
        @set('isSaved', true)
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