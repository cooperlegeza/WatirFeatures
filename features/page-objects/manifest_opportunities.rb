require 'page-object'
require 'watir-webdriver'

class ManifestOpportunities
  include PageObject
  page_url 'http://manifestcorp.com/opportunities/all-opportunities/'

  def select_location_list_columbus
    @browser.select_list(:name => 'opportunity_loc').select('Columbus, OH')
  end

  def select_opportunity_list_contract
    @browser.select_list(:name => 'opportunity_type').select('Contract')
  end

  def get_opportunity_location_divs
    @browser.divs(:class => 'opp-loc')
  end

  def get_opportunity_type_divs
    @browser.divs(:class => 'opp-type')
  end

end