require 'page-object'
require 'watir-webdriver'

class SouthwestHome
  include PageObject
  page_url 'www.southwest.com'

  DISABLED = 'carouselDisabled'
  TODAY_ENABLED = 'carouselTodaySodaIneligible'
  ENABLED = 'carouselEnabledSodaIneligible'
  IS_TODAY = 0

  attr_accessor = :full_date,'carouselfulldate'

  text_field(:departure_location, :id => 'air-city-departure')
  text_field(:arrival_location, :id => 'air-city-arrival')
  button(:submit_button, :id => 'jb-booking-form-submit-button')
  list_items(:all_dates, :css => "li[carouselfulldate]")

  def input_departure_and_arrival (departure, arrival)
    self.departure_location = departure
    self.arrival_location = arrival
    self.submit_button
  end

  def search_for_li_by_date(list_date)
    @browser.li(:css, "li[carouselfulldate='#{list_date.strftime("%Y/%m/%d")}']")
  end

  def get_full_date(date_element)
    date_element.attribute(FULL_DATE_ATTR)
  end

  def find_if_day_is_enabled(date_string)
    selected_full_date_div = search_for_li_by_date(date_string)
    class_name_of_div = selected_full_date_div.class_name
    class_name_of_div == TODAY_ENABLED or class_name_of_div == ENABLED
  end
  def check_if_date_is_disabled(date)
    date.class_name == DISABLED
  end

end