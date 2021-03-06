require 'spec_helper'

describe "pagination" do
  before(:each) do
    VCR.use_cassette('paginate_search_results_by_10', :erb => {:username => ENV['OKC_USERNAME'], :password => ENV['OKC_PASSWORD']}) do
      okc = OKCupid.new(ENV['OKC_USERNAME'], ENV['OKC_PASSWORD'])
      
      @search = okc.search({
        gentation: 'girls who like guys'
      })
      @search.results
      @search.load_next_page
    end
  end
  
  it "snags 10 more results" do
    @search.results.size.should == 20
    @search.results.all? {|p| p.kind_of?(OKCupid::Profile)}.should == true
  end
end