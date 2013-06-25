#Select a value in a html select field.
#Pass an ember data model, plain object or value
@select = (selector, context, model, valueKey = 'id') ->
  if model instanceof DS.Model
    value = model.get(valueKey)
  else if value.id
    value = model[valueKey]
  else
    value = model

  fillIn(selector, context, value)