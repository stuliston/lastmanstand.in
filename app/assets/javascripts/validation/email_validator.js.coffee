LMS.EmailValidator = {
  isValid: (email) ->
    return unless email
    email.match(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/)
}