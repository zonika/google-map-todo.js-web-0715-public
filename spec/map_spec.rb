describe "Index" do
  include Capybara::DSL
  include Capybara::RSpecMatchers

  let(:location_data) { JSON.parse(File.read('spec/fixtures/student_location.json')) }
  let(:spinner) { '<i class="fa fa-spinner fa-spin' }
  let(:map_link) { "http://www.google.com/intl/en-US_US/help/terms_maps.html" }
  let(:messages) { ["Map data ©", "Google"] }

  before(:each) do
    visit "/"
  end

  it "replaces the spinner with the user's longitude in the #longitude div" do
    sleep(5)
    longitude_html = page.evaluate_script("document.getElementById('longitude').innerHTML.substring(0,6)")
    expect(longitude_html).to eq(location_data["longitude"])
    expect(longitude_html).to_not include(spinner)
  end

  it "replaces the spinner with the user's latitude in the #latitude div" do
    sleep(5)
    latitude_html = page.evaluate_script("document.getElementById('latitude').innerHTML.substring(0,5)")
    expect(latitude_html).to eq(location_data["latitude"])
    expect(latitude_html).to_not include(spinner)
  end

  it "replaces the spinner with a google map in the #map_canvas div" do
    sleep(5) 
    expect { page.find(:xpath, '//a[@title="Click to see this area on Google Maps"]') }.to_not raise_error
    expect(page).to have_selector('.gm-style-mtc', count: 2)
    expect(page.all(".gm-style-mtc")[0].text).to eq("Map")
    expect(page.all(".gm-style-mtc")[-1].text).to eq("Satellite")
    container = page.all(".gmnoprint")[0]
    messages.each { |msg| expect(container.text).to include(msg) }
    
    map_canvas_html = page.evaluate_script("document.getElementById('map_canvas').innerHTML")
    expect(map_canvas_html).to_not include(spinner)
  end
  
end