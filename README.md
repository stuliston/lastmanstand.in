## GOALS

* Slick, minimal UI
* Ease of use
* Visualisation of data (your position)


## GLOSSARY

* USER            - A person who has registered their email, password and name so they can start to play the game
* PROFILE         - A public profile of a user. (Keeps the user for authentication type stuff)
* GAME            - A group of PROFILE's who play against each other (possibly with a name like "The Hooroo Invitational"). A user can be involved in many GAMES
* GAME MEMBERSHIP - A PROFILE's association to a GAME they have joined
* TEAM            - An EPL football team e.g. Man Utd, Chelsea
* MATCH           - A fixture comprising of a home TEAM, and AWAY team and a RESULT
* RESULT          - Win/lose/draw
* PREDICTION      - A USER select a TEAM that will win a given MATCH


## MVP

* One sport to begin with. EPL starts again in a few months (problem: how do we attract early-adopters and test the app ourselves?)
* Simplest login technique possible (one that provides an avatar)
* No schedule / results API. Manual entry to start with


## GENERAL PRODUCT THOUGHTS
This app will naturally be quite seasonal and will if have short spurts of signups near the start of a season and slow drop offs until the end. This will make learning behaviours trickier than an app with constant use throughout a year. Longer term:
* What could be done to keep people's attention?
* What could be done to allow games to start part-way through the season?

## USER STORIES

* User can create and account with username and password
* User can sign in with google
* User can sign in with facebook
* User can sign in with twitter
* User can view homepage with info about app and pricing
* User can create a new game
* User can invite 2 friends to join game by email for free
* User can accept an invitation
* User can ignore an invitation
* User can change the invitation message sent to friends
* User can view all their games on dashboard
* User can view all pending invitations on a dashboard
* User only sees games that are current on the dashboard (low priority)
* User can view past games (low priority)
* User can view the current fixture
* User can pick winners from the current fixture
* User is limited to pick teams that they have not picked before
* User is prevented from picking teams after the round closes
* User can view all players in a game
* User can add players to a game
* User can upgrade a game that has run out of allowed number of players
* System takes payment for game upgrade associates credit(?) with game


## STRETCH

As the site maintainer, I want to create multiple rounds of fixtures, so that players


## IDEAS (AKA Scope creep)
-----------------------
* Use odds system to show who is playing it safe and who is gambling?
* You could use the above info to indicate a 'favourite' early-on
* 'Casualties timeline' - round-by-round graph of who dropped out (or lost a life) in each round
* How is your game going compared to others. Leaderboard of games with potential prizes? Walking the gambling fine line maybe?


## SUBSCRIPTIONS

### Option 1: Charge per 'game'

#### pros
* The guy in the group who always organises these things will likely just pay as they create the game
* We can price depending on the game size. E.g free for 2 players, $5 for up to 5 players, $10 up to 10 players, $25 for 11+ players
* This pricing structure is compatible with our idea of having a unique code/link to invite people to your game

#### cons
* When a game gets more popular than expected, charging additional funds might get tricky (if they move a bracket in terms of pricing)
* As users, you might want to be involved in many games. This could get expensive
* Could be complicated to invite people to the game if you have (for example) 10 possible members

## TECH DESIGN CONSIDERATIONS
* Store all dates in UTC
* User should see all dates in their time zone.


## TECH STUFF
* Thinking of bringing in http://foundation.zurb.com/docs/ for it's apparently excellent mobile first css goodness. Just the basics, not the kitchen sink
* JS Testing. Konacha looks good for it's integration testing capabilities and rails integration. There is some very nice ember testing stuff that's come out recently that makes testing much easier - it's unfortunately based on qunit. Not so bad but the dsl isn't as nice.


## CHANGE LOG

### RM (19/06)
I've created a reasonably deep heirarchy for league, season, round, fixture. It felt like maybe one or two of these was optional but added them anyway as it makes some things simpler. Lets chat if it doesn't make sense.

The seed data should populate a rough semi-random afl premiership season. It's messy and could do with enhancements like not putting all games for a round on a single date/time but makes it possible to build some ui with some data for now.

### RM (16/06)
Started on a user creating a game and inviting other participants. Lots of loose ends in here. A missing feature in Ember data has made me move on from that for now but a pull request exists with some discussion around it so it might be available pretty soon. Plenty of other things to do in the mean time.

The invitations stuff is very basic at the moment, no tokens or anything like that. This needs a short discussion.

