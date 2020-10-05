class NameGameHomePage < BasePage

  ##################################################
  # ##ELEMENTS
  # ################################################

  div(:name_game_header, css: ".header")

  h1(:name_game_question_header, css: ".text-center")

  span(:name_in_question_span, id: "name")

  div(:stat_div, id: "stats")
  span(:tries_span){stat_div_element.span(css: ".attempts")}
  span(:corrects_span){stat_div_element.span(css: ".correct")}
  span(:streaks_span){stat_div_element.span(css: ".streak")}


  def name_game_photo_divs
    divs(css: ".photo")
  end

  ##################################################
  # ##METHODS
  # ################################################

  def url_for_page
    "http://www.ericrochester.com/name-game/"
  end

  def name_in_question
    name_in_question_span_element.text
  end

  def wait_for_name_game_question
    wait_for_element(name_in_question_span_element)
  end

  def photo_div_with_name(name)
    name_game_photo_divs.find{|photo_div| photo_div.text.include?(name)}
  end

  #select photo indexes between 0-4
  def select_photos_with_index(index)
    click_element(name_game_photo_divs[index])
  end

  def select_photo_with_name(name)
    click_element(photo_div_with_name(name))
  end

  def all_wrong_photo_divs
    name_game_photo_divs.select{|photo_div| !photo_div.text.include?(name_in_question)}
  end

  def wrong_photo_div
    name_game_photo_divs.find{|photo_div| !photo_div.text.include?(name_in_question)}
  end

  def correct_photo_div
    name_game_photo_divs.find{|photo_div| photo_div.text.include?(name_in_question)}
  end

  def select_wrong_photo
    click_element(wrong_photo_div)
  end

  def select_correct_photo
    click_element(correct_photo_div)
  end

  def select_wrong_photo_number_of_times(number)
    for i in 1..number
      click_element(wrong_photo_div)
    end
  end

  def select_correct_photo_number_of_times(number)
    for i in 1..number
      click_element(correct_photo_div)
    end
  end

  def number_of_tries
    tries_span_element.text
  end

  def number_of_corrects
    corrects_span_element.text
  end

  def number_of_streaks
    streaks_span_element.text
  end

  def select_a_number_of_wrong_photos(number)
    for i in 0..number-1
      click_element(all_wrong_photo_divs[i])
    end unless number == 0
  end

  def wait_for_new_name
    current_name = name_in_question_span_element.text
    #to-do make better wait here
    @browser.wait_until { !name_in_question_span_element.text.include?(current_name) }
  end

  def header_text_displays_correctly?
    name_game_header_element.text.include?("name game")
  end

  def name_game_text_displays_correctly?
    !(/who is ([^"]*)\?/).match(name_game_question_header_element.text).nil?
  end


end