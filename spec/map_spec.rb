describe "Index" do

  let(:spinner) { '<i class="fa fa-spinner fa-spin' }
  let(:map_link) { "http://www.google.com/intl/en-US_US/help/terms_maps.html" }
  let(:messages) { ["Map data ©", "Google"] }

  before(:each) do
    visit "/"
  end

  it "replaces the spinner with the user's longitude in the #longitude div" do
    expect(page.find("#longitude")).to have_content('-74.0')
    expect(page.find("#longitude")).to_not have_content(spinner)
  end

  it "replaces the spinner with the user's latitude in the #latitude div" do
    expect(page.find("#latitude")).to have_content('40.7')
    expect(page.find("#latitude")).to_not have_content(spinner)
  end

  it "replaces the spinner with a map in the #map_canvas div" do
    expect(page.find("#map_canvas")).to_not have_content(spinner)
    
    expect { page.find(:xpath, '//a[@title="Click to see this area on Google Maps"]') }.to_not raise_error
    expect(page.all(".gm-style-mtc")[0].text).to eq("Map")
    expect(page.all(".gm-style-mtc")[-1].text).to eq("Satellite")
    
    container = page.all(".gmnoprint")[0]
    messages.each { |msg| expect(container.text).to include(msg) }
  end 

end

