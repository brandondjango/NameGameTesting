#Probability Statistics

We tracked several statistics for this testing in various scenarios. The template for each scenario is as follows:

Given 1 name is answered differently than all other names when it appears in the name game question, does that name show any statistical anomaly when compared to all other names.

In each scenario, we tracked 4 statistics:

* The number of times the name that is answered differently appears in the question
* The number of times the name that is answered differently appears in the pool of answers(including times is appears in the question)
* The number of times all other names appear in the question
* The number of times all other names appeared in the pool of answers(including times is appears in the question)

#Scenarios:

There are 4 main scenarios:

* (1)The first name is answered correctly while all other names are answered incorrectly
* (2)The first name is answered incorrectly while all other names are also answered correctly
* (3)The first name is answered correctly while all other names are answered correctly
* (4)The first name is answered incorrectly while all other names are answered incorrectly

#Results

Each scenario was run 4 times in a session involving 200 questions.  This means the first name was selected according to the scenario criteria, and the other 199 names were chosen according the other criteria.

Remember, we don't care about the first time the first name appears because we are evaluating how many times it appears after it has already been selected once.

I did not crunch the actual data for the purpose of this exercise, but I included sample data.  To see this output in the terminal, run the following command:

>bundle exec cucumber -p probability

This is definitely a more time intensive way to aggregate some of the data, but I do believe it was the best blackhat way to gain the empirical data we would have presented.
