#Testing Strategy

This test strategy will outline testing of the name game featured at http://www.ericrochester.com/name-game/.

##Client Scope and Feature

The following is all the client scope provided:
Platforms & Screen Sizes:
* Web, iOS and Android
* Mobile, Tablet, Desktop

Features:
* Name & Picture Matching
* Correct Answers have a lower probability of repeating
* Incorrect Answers have a higher probability of repeating
* Counters:
    * Total number of attempts
    * Total number of correct answers
    * Current Streak for correct answers
* Adding additional colleagues with matching pictures to the pool of colleagues
* Removing names and pictures from the pool of colleagues

##Testing Strategy

###Scope

For this product, our testing will focus around usability using manual and automated testing, feature by feature.  Automated testing will by limited to browser, as browsers operate widely the same across devices. To simulate automation in a mobile device, we'll use browser resizing tools to emulate the phone feel(this is a good way to automate web app bugs without spinning up mobile testing setups).

Testing will be limited to Chrome, Firefox, and Safari, as those are the 3 most widely used browsers(https://www.statista.com/statistics/272697/market-share-desktop-internet-browser-usa/#:~:text=The%20most%20popular%20current%20browsers,Mozilla%20Firefox%20and%20Apple's%20Safari)

As stated before, mobile automated testing was done with browser resizing in this project, but manual testing was done on iOS 14/iPhone 8 and an Android 10/Pixel 3 simulator.  

We will not be checking the integrity of data(pictures correlating to names).  We do not have access to that data, nor the ability to add and remove data from the name game.

Finally, we will not focus on accessibility and security testing, though there are several tools available.

##Features

###Name & Picture Matching

Without access to the employee directory, it is impossible using the name game alone to verify employee names match pictures.

However, users can make note that pictures stay associated to the same pictures.  In this case, that is what we did manually with several employees.  With this approach, we confirmed accross sessions picture and data were being pulled consistently in the same pairs.  In the interest of time, this was a cursory check.  Given more time, we could use rikuli to recognize images, and our existing framework to get the names associated with those photos in the DOM.

The strangest occurrence seemed to be a data pair named "WillowTree Staff" with a WillowTree logo picture. This is marked in the defect report.

###Correct/Incorrect Answers have a lower probability of repeating

The prompt for this feature is somewhat unclear: if correct answers appear less frequently, does that mean an employees name appears less amongst options, or does it mean a question with that employees name is less likely to appear again?

In attempt to cover as much functionality as possible, we tested for both.

We took a completely automated approach.  The summary of this approach can be found in the ProbabilityStatistics.md file.

##Counter tests

All counter tests were able to be automated, and appear in the counter_tests directory of this project.

##Adding/Removing employees from the name pool

As stated previously, we did not focus much on the picture matching/backend where pictures and names are pulled. 

However, something pertinent we did note is that there seemed to be no way to clear counter data, even after clearing the local browser cache.  There is a possibility that once a name/picture pair is removed, it could still be present in active sessions of the game.

To properly test this, we need to be able to add/remove pictures, and then verify  those names/pictures are added and taken away. We can do that with the tools we have available by iterating over several questions at the very least.


