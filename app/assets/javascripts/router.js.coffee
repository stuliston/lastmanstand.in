LMS.Router.map ->

  @resource('dashboard')

  @resource('games', {path: '/games'}, ->
    @route('new')
    @resource('game', {path: ':game_id'}, ->
      @route('current_round')
      @route('members')
      @route('rounds')
      @route('round', {path: '/rounds/:round_number'}) #weird !

      # @resource('rounds', ->
      #   @route('index')
      #   @resource('round', {path: ":round_id"})
      # )

    )
  )

