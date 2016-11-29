require 'page-object'
require 'watir-webdriver'

class SouthwestHome
  include PageObject
  page_url 'www.southwest.com'

  attr_accessor :full_date,'carouselfulldate'
  attr_accessor :disabled,'carouselDisabled'
  attr_accessor :today_enabled,'carouselTodaySodaIneligible'
  attr_accessor :enabled,'carouselEnabledSodaIneligible'


  text_field(:departure_location, :id => 'air-city-departure')
  text_field(:arrival_location, :id => 'air-city-arrival')
  button(:submit_button, :id => 'jb-booking-form-submit-button')
  list_items(:all_dates, :css => "li[carouselfulldate]")

  def input_departure_and_arrival (departure, arrival)
    self.departure_location = departure
    self.arrival_location = arrival
    self.submit_button
  end

  def search_for_li_by_date(date_string)
    @browser.li(:css, "li[carouselfulldate='#{date_string.strftime("%Y/%m/%d")}']")
  end

  def get_full_date(date_element)
    date_element.attribute_value(full_date)
  end


end