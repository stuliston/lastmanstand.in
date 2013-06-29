Ember.Handlebars.registerBoundHelper 'timeToNow', (date, currentTime, options) ->

  currentTime = new XDate(currentTime)
  date = new XDate(date)

  diffDays = currentTime.diffDays(date)

  if diffDays >= 1
    Math.round(diffDays, 0) + " days"
  else
    diffHours = currentTime.diffHours(date)
    if diffHours >= 1
      Math.round(diffHours, 0) + " hours"
    else
      diffMins = currentTime.diffMinutes(date)
      Math.round(diffMins, 0) + " minutes"

