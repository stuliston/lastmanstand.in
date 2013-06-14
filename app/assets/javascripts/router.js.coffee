LMS.Router.map ->

  @resource('dashboard')

  @resource('games', {path: '/games'}, ->
    @route('new')
    @resource('game', {path: ':game_id'}, ->
      @route('edit')
    )
  )

