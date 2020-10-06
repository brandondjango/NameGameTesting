Given(/^I am on the Name Game$/) do
  page = NameGameHomePage.new @browser
  @browser.goto page.url_for_page

  #wait for name game to load
  page.wait_for_name_game_question
  page.wait_for_photos_to_load
end

When(/^I select a wrong photo$/) do
  page = NameGameHomePage.new @browser
  page.select_wrong_photo
end

When(/^I select the correct photo$/) do
  page = NameGameHomePage.new @browser
  page.select_correct_photo
end

When(/^I select the same wrong photo "([^"]*)" times$/) do |number|
  page = NameGameHomePage.new @browser
  page.select_wrong_photo_number_of_times(number.to_i)
end

When(/^I select the same correct photo "([^"]*)" times$/) do |number|
  page = NameGameHomePage.new @browser
  page.select_correct_photo_number_of_times(number.to_i)
end

Then(/^I should see the Tries Counter show "([^"]*)"$/) do |expected_count|
  page = NameGameHomePage.new @browser
  expect(page.number_of_tries.to_i == expected_count.to_i).to (be true), "Expected number of tries to be #{expected_count} bit it was #{page.number_of_tries}"
end

Then(/^I should see the Corrects Counter show "([^"]*)"$/) do |expected_count|
  page = NameGameHomePage.new @browser
  expect(page.number_of_corrects.to_i == expected_count.to_i).to (be true), "Expected number of tries to be #{expected_count} bit it was #{page.number_of_corrects}"
end

Then(/^I should see the Streaks Counter show "([^"]*)"$/) do |expected_count|
  page = NameGameHomePage.new @browser
  expect(page.number_of_streaks.to_i == expected_count.to_i).to (be true), "Expected number of tries to be #{expected_count} bit it was #{page.number_of_streaks}"
end


When(/^I iterate through "([^"]*)" questions of the name game selecting "([^"]*)" wrong photos for every correct$/) do |number_of_questions, wrong_answers_per_question|
  page = NameGameHomePage.new @browser
  for i in 1..number_of_questions.to_i
    page.select_a_number_of_wrong_photos(wrong_answers_per_question.to_i)
    page.select_correct_photo
    page.wait_for_new_name
  end
end

Then(/^I should see the header displays correct text$/) do
  page = NameGameHomePage.new @browser
  expect(page.header_text_displays_correctly?).to (be true), "Expected the header to display the correct text but it did not"
end

And(/^I should see the name game question display in a correct format$/) do
  page = NameGameHomePage.new @browser
  expect(page.name_game_text_displays_correctly?).to (be true), "Expected the name game question to display correctly but it did not"
end

When(/^I answer for the name "([^"]*)" correctly and every other name wrong over "([^"]*)" questions$/) do |name, iterations|
  page = NameGameHomePage.new @browser

  iterations = iterations.to_f

  counter_paremeter_name_appears_in_question = 0
  counter_parameter_name_appears_in_pool = 0

  for i in 1..iterations
    if page.name_in_question.include?(name)
      page.select_correct_photo
      page.wait_for_new_name
      counter_paremeter_name_appears_in_question+=1
      counter_parameter_name_appears_in_pool+=1
    else
      counter_parameter_name_appears_in_pool+=1 if page.name_included_in_pool?(name)
      page.select_a_number_of_wrong_photos(4)
      page.select_correct_photo
      page.wait_for_new_name
    end
  end
  print "\n\nThe percentage of times #{name} was seen in question was #{(counter_paremeter_name_appears_in_question/iterations).round(2)}\n\n"
  print "\n\nThe percentage of times #{name} was seen in pool of answers was #{(counter_parameter_name_appears_in_pool/iterations).round(2)}\n\n"
end

And(/^I answer for the name "([^"]*)" incorrectly and every other name wrong over "([^"]*)" questions$/) do |name, iterations|
  page = NameGameHomePage.new @browser

  iterations = iterations.to_f

  counter_paremeter_name_appears_in_question = 0
  counter_parameter_name_appears_in_pool = 0

  for i in 1..iterations.to_f
    if page.name_in_question.include?(name)
      page.select_a_number_of_wrong_photos(4)
      page.select_correct_photo
      counter_paremeter_name_appears_in_question+=1
      counter_parameter_name_appears_in_pool+=1
      page.wait_for_new_name
    else
      counter_parameter_name_appears_in_pool+=1 if page.name_included_in_pool?(name)
      page.select_a_number_of_wrong_photos(4)
      page.select_correct_photo
      page.wait_for_new_name
    end
  end
  print "\n\nThe percentage of times #{name} was seen in question was #{(counter_paremeter_name_appears_in_question/iterations).round(2)}\n\n"
  print "\n\nThe percentage of times #{name} was seen in pool of answers was #{(counter_parameter_name_appears_in_pool/iterations).round(2)}\n\n"
end

When(/^I answer for the first name game name incorrectly, and every other name correct over "([^"]*)" questions$/) do |iterations|
  page = NameGameHomePage.new @browser

  iterations = iterations.to_f

  name_in_question_hash = {}
  name_in_pool_hash = {}

  first_name = page.name_in_question

  for i in 1..iterations.to_f
    #Mark if name appeard in question
    if name_in_question_hash.key?(page.name_in_question)
      name_in_question_hash[page.name_in_question]+=1
    else
      name_in_question_hash[page.name_in_question] = 1
    end
    #mark if name appeared in pool of answers for question
    page.names_in_photo_divs.each{ |name|
      if name_in_pool_hash.key?(name)
        name_in_pool_hash[name]+=1
      else
        name_in_pool_hash[name] = 1
      end
    }


    #############Select Logic

    if page.name_in_question.include?(first_name)
      page.select_a_number_of_wrong_photos(4)
      page.select_correct_photo
      page.wait_for_new_name
    else
      page.select_correct_photo
      page.wait_for_new_name
    end

  end

  print "\n\n#{first_name} was answered incorrectly every time, and was seen in the question #{name_in_question_hash[first_name]} times out of #{iterations}\n\n"
  print "\n\n#{first_name} was seen in the pool #{name_in_pool_hash[first_name]} times out of #{iterations}\n\n"
  print "Total stats:\n\n"
  sorted_name_in_pool_hash = name_in_pool_hash.sort_by(&:last)
  sorted_name_in_question_hash = name_in_question_hash.sort_by(&:last)
  print "Names in pool:\n"
  sorted_name_in_pool_hash.each{|array| print "#{array}\n"}

  print "\n\nNames in question:\n"
  sorted_name_in_question_hash.each{|array| print "#{array}\n"}
end