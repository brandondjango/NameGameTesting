class NameGameHomePage < BasePage

  ##################################################
  # ##ELEMENTS
  # ################################################

  div(:name_game_header, css: ".header")

  span(:name_in_question_span, css: "name")

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

  def number_of_tries
    tries_span_element.text
  end

  def number_of_corrects
    corrects_span_element.text
  end

  def number_of_streaks
    streaks_span_element.text
  end


end