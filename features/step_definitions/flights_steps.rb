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
    TimeUtils.new.make_this_many_days_from_today_inclusive(TOTAL_DAYS_SELECTED).each do |day_that_has_been_selected|
      expect(page.find_if_day_is_enabled(day_that_has_been_selected, day_count)).to be true
    end
  end
end

And(/^I can't choose a departure date from the past$/) do
  time_utils = TimeUtils.new
  on_page SouthwestHome do |page|
    page.all_dates_elements.each do |date|
        if(time_utils.determine_if_is_before_today(page.get_full_date(date)))
          expect(page.check_if_date_is_disabled(date)).to eq (true)
        end
    end
  end
end