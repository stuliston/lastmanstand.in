LMS.Router.map ->

  @resource('games', {path: '/games'}, ->
    @route('new')
    @resource('game', {path: ':game_id'}, ->
      @route('current_round')
      @route('members')
      @route('rounds')
      @route('edit')
      @route('round', {path: '/rounds/:round_number'}) #weird !
    )
  )
  @resource('game_invitations')

LMS.Router.reopen
  location: 'history'
