#Defect Report

##Defect 1: Long Names do not show in photos correctly

Relevant hardware/software/browsers:
All known.

Reproduction steps:

Given I am on the name-game
And I eventually click an image with a long name(you may have to go through a couple iterations of the game)

Observed result:
The text does not properly wrap in the photo.  This is especially seen on mobile devices, even for names not that long.

This gives a confusing user experience on mobile where it is not readily clear full names are being displayed.

Expected result:
Full names should be visible across reasonable browser resizings and mobile devices.

##Defect 2: Load state on start up of webapp

Relevant hardware/software/browsers:
All known.

Reproduction steps:

Load the app for the first time in a browser(so far this is not know to be reproduceable by clearing the cache)
Observe the startup state

Observed result:
The page loads for a substantial period of time with both a name in the "who am I" question or photos loaded.

Expected Result:
One would expect a page like this to have a spinner or some sort of loading indication.

##Defect 3: No reset to the game available conventionally

Relevant hardware/software/browsers:
All known.

Reproduction steps:

Load the app
Answer questions
Leave the page
Come back to the name game
Note the status
Refresh the page and empty the cache
Not the page

Observed result:
The page loads never resets the state of the game in the same browser.  The same counters are always available, and assumingly any other game features.

Expected Result:
To play the game multiple times, we need to be able to reset the game.  Users should not expect to see same game data between days of having last played.

##Defect 4: Selecting wrong answer after a correct answer affects the count incorrectly

Relevant hardware/software/browsers:
All known.

Reproduction steps:

Load the app
Answer a question correctly
Then, before the next question loads, select a wrong answer
Note the counts

Observed result:
After the scenario above, note that counts tries and streaks are updated after a correct answer is already selected. 

Expected Result:
A player should not be punished after selecting a correct answer within the same question.  We should disable selecting answers after selecting the correct one until the newest name loads.

This is really 2 bugs in one, but one fix could address both.

##Defect 5: Console log prints unnecessarily

Relevant hardware/software/browsers:
All known.

Reproduction steps:

Load the app
Answer questions correctly, play rounds of the game normally
Open the dev tools
View the console logs
Note the log

Observed result:
The logs print tons of data for seemingly no reason.  Ideally, we would only want prints here for debugging, not in production.

Expected Result:

We should not be printing to the console log in production

This is really 2 bugs in one, but one fix could address both.

