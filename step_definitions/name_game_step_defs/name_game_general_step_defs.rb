Given(/^I am on the Name Game$/) do
  page = NameGameHomePage.new @browser
  @browser.goto page.url_for_page

  #wait for name game to load
  page.wait_for_name_game_question
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