## GOALS

* Slick, minimal UI
* Ease of use
* Visualisation of data (your position)


## GLOSSARY

USER            - A person who has registered their email, password and name so they can start to play the game
PROFILE         - A public profile of a user. (Keeps the user for authentication type stuff)
GAME            - A group of PROFILE's who play against each other (possibly with a name like "The Hooroo Invitational"). A user can be involved in many GAMES
GAME MEMBERSHIP - A PROFILE's association to a GAME they have joined
TEAM            - An EPL football team e.g. Man Utd, Chelsea
MATCH           - A fixture comprising of a home TEAM, and AWAY team and a RESULT
RESULT          - Win/lose/draw
PREDICTION      - A USER select a TEAM that will *win* a given MATCH


## MVP

* One sport to begin with. EPL starts again in a few months (problem: how do we attract early-adopters and test the app ourselves?)
* Simplest login technique possible (one that provides an avatar)
* No schedule / results API. Manual entry to start with


## USER STORIES

As a potential PLAYER, I want to log-in so that I can start playing the game.
* email, avatar, password, display name

As a PLAYER, I want to create a new GAME so that I can begin to guess scores
* name

As a user, I want to invite my friends to play my GAME

As Rob and Stu, I want to integrate Braintree (or similar) to charge users a fee
* Need to hypothesise and measure what will be the most successful model for this

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


## TECH - TODO
* Setup Konacha and get a few basic js specs in place


