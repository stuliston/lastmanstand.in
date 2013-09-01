LMS.Router.map ->

  @route('sign_in')
  @route('sign_up')

  @resource('games', {path: '/games'}, ->
    @route('new')
    @resource('game', {path: ':game_id'}, ->
      @route('members')
      @route('rounds')
      @route('edit')
      @route('round', {path: '/rounds/:round_number'}) #weird !
    )
  )
  @resource('game_invitations')

LMS.Router.reopen
  location: 'history'
