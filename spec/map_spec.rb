describe "Index" do
  include Capybara::DSL
  include Capybara::RSpecMatchers

  let(:spinner) { '<i class="fa fa-spinner fa-spin' }
  let(:map_link) { "http://www.google.com/intl/en-US_US/help/terms_maps.html" }
  let(:messages) { ["Map data ©", "Google"] }

  before(:each) do
    visit "/"
  end

  it "adds the user's longitude in the #longitude div" do
    expect(page.find("#longitude")).to have_content('-74.0')
  end

  it "removes the spinner from the #longitude div" do
    longitude_html = page.evaluate_script("document.getElementById('longitude').innerHTML")
    expect(longitude_html).to_not include(spinner)
  end

  it "adds the user's latitude in the #latitude div" do
    expect(page.find("#latitude")).to have_content('40.7')
  end

  it "removes the spinner from the #latitude div" do
    latitude_html = page.evaluate_script("document.getElementById('latitude').innerHTML")
    expect(latitude_html).to_not include(spinner)
  end

  it "adds a google map to the #map_canvas div" do 
    expect { page.find(:xpath, '//a[@title="Click to see this area on Google Maps"]') }.to_not raise_error
    expect(page).to have_selector('.gm-style-mtc', count: 2)
    expect(page.all(".gm-style-mtc")[0].text).to eq("Map")
    expect(page.all(".gm-style-mtc")[-1].text).to eq("Satellite")
    container = page.all(".gmnoprint")[0]
    messages.each { |msg| expect(container.text).to include(msg) }
  end 

  it "removes the spinner from the #map_canvas div" do
    map_canvas_html = page.evaluate_script("document.getElementById('map_canvas').innerHTML")
    expect(map_canvas_html).to_not include(spinner)
  end
end