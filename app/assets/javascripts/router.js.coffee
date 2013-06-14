LMS.Router.map ->

  @resource('dashboard')

  @resource('games', {path: '/games'}, ->
    @route('new')
  )
  @resource('game', {path: '/game/:game_id'}, ->
    @route('edit')
  )
