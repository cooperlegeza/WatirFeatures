require 'page-object'

include PageObject::PageFactory

DEPARTURE_LOCATION = 'CMH'
ARRIVAL_LOCATION = 'MCO'
TOTAL_DAYS_SELECTED = 4

When(/^I search for a flight using the default$/) do
  visit_page SouthwestHome do |page|
    page.input_departure_and_arrival(DEPARTURE_LOCATION, ARRIVAL_LOCATION)
  end
end

Then(/^the dates I searched for are highlighted in the search results$/) do
  on_page SouthwestHome do |page|
    day_count = 0
    TimeUtils.new.make_this_many_days_from_today_inclusive(TOTAL_DAYS_SELECTED).each do |day_that_has_been_selected|
      selected_full_date_div = page.search_for_li_by_date(day_that_has_been_selected)
      if(day_count == 0)
        expect(selected_full_date_div.class_name).to eq ('carouselTodaySodaIneligible')
      else
        expect(selected_full_date_div.class_name).to eq ('carouselEnabledSodaIneligible')
      end
      day_count += 1
    end
  end
end

And(/^I can't choose a departure date from the past$/) do
  time_utils = TimeUtils.new
  on_page SouthwestHome do |page|
    all_carousels = page.search_for_all_carousel_lis
    all_carousels.each do |date|
        if(time_utils.determine_if_is_before_today(date.attribute_value('carouselfulldate')))
          expect(date.class_name).to eq ('carouselDisabled')
        end
    end
  end
end