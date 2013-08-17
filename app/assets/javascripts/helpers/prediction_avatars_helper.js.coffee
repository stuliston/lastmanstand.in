Ember.Handlebars.registerBoundHelper 'predictionAvatars', (predictions) ->

  maxToDisplay = 4
  numberOfPredictions = predictions.get('length')
  displayAll = numberOfPredictions <= maxToDisplay
  extraNames = []

  out = '<ul class="predictions unstyled horizontal">'

  predictions.forEach (prediction, index) ->
    if displayAll || index < maxToDisplay
      url = prediction.get('profile.smallThumbAvatarImageUrl')
      out += "<li><img src='#{url}'/></li>"
    else
      extraNames.push(prediction.get('profile.name'))

  extras = numberOfPredictions - maxToDisplay

  if extras > 0
    out += "<li class='extras' title='#{extraNames.join(", ")}'>+#{extras}</li>"

  out += '</ul>'

  new Handlebars.SafeString(out)
