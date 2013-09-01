LMS.SignInController = Ember.ObjectController.extend

  needs: ['currentUser']

  errorMessage: null
  isSaving: false
  afterSignInTransition: null

  isEmailValid: (->
    LMS.EmailValidator.isValid(@get('email'))
  ).property('email')

  isValid: Ember.computed.and('isEmailValid', 'password')
  isInvalid: Ember.computed.not('isValid')
  isDisabled: Ember.computed.or('isInvalid', 'isSaving')

  actions:
    signIn: ->
      @set('isSaving', true)
      data =
        remote: true
        commit: "Sign in"
        utf8: "✓"
        user:
          remember_me: 1,
          password: @get('model.password'),
          email: @get('model.email')

      $.ajax('/users/sign_in', {
        type: 'POST'
        data: data
        dataType: 'json'
      }).done((response) =>
        @get('store').adapterForType(LMS.User).didFindRecord(@get('store'), LMS.User, response)
        user = LMS.User.find(response.user.id)
        @get('controllers.currentUser').set('model', user)
        if @get('afterSignInTransition')
          @get('afterSignInTransition').retry()
        else
          @transitionToRoute('index')
      ).fail((response) =>
        @set('errorMessage', response.responseJSON.error)
      ).always( =>
        @set('isSaving', false)
      )

    cancel: ->
      @get('model').deleteRecord()
      @transitionToRoute('index')
