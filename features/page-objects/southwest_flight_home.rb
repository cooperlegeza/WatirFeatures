require 'page-object'
require 'watir-webdriver'

class SouthwestHome
  include PageObject
  page_url 'www.southwest.com'

  text_field(:departure_location, :id => 'air-city-departure')
  text_field(:arrival_location, :id => 'air-city-arrival')

  def input_departure_and_arrival (departure, arrival)
    self.departure_location = departure
    self.arrival_location = arrival
    @browser.button(:id => 'jb-booking-form-submit-button').click
  end

  def search_for_li_by_date(date_string)
    @browser.li(:css, "li[carouselfulldate='#{date_string.strftime("%Y/%m/%d")}']")
  end

  def search_for_all_carousel_lis
    @browser.lis(:css, "li[carouselfulldate]")
  end
end