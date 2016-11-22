require 'page-object'

include PageObject::PageFactory

When(/^I filter jobs by Columbus$/) do
  visit_page (ManifestOpportunities) do |page|
    page.select_location_list_columbus
  end

end

Then(/^only Columbus opportunities are present$/) do
  sleep 2
  on_page (ManifestOpportunities) do |page|
    opportunity_location_div = page.get_opportunity_location_divs

    opportunity_location_div.each do |opp_loc_div|
      expect(opp_loc_div.text).to eq 'Columbus, OH'
    end
  end
end

When(/^I filter jobs by contract$/) do
  visit_page (ManifestOpportunities) do |page|
    page.select_opportunity_list_contract
  end
end

Then(/^only contract opportunities are present$/) do
  on_page (ManifestOpportunities) do |page|
    opportunity_type_divs =   page.get_opportunity_type_divs

    opportunity_type_divs.each do |opp_type_div|
      expect(opp_type_div.text).to eq 'Contract'
    end
  end
end