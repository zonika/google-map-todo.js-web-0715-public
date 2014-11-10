describe "Index" do

  let(:spinner)    { '<i class="fa fa-spinner fa-spin' }
  let(:map_div)    { "<div class=\"gm-style\" style=\"position: absolute; left: 0px; top: 0px; overflow: hidden; width: 100%; height: 100%; z-index: 0;\">" }
  let(:cursor_url) { "https://maps.gstatic.com/mapfiles/openhand_8_8.cur" }

  before(:each) do
    visit "/"
  end

  it "replaces the spinner with the user's longitude to #longitude div" do
    expect(page.find("#longitude")).to have_content('-74.01')
    expect(page.find("#longitude")).to_not have_content('40.705')
  end

  it "replaces the spinner with the user's latitude to #latitude div" do
    expect(page.find("#latitude")).to have_content('')
    expect(page.find("#latitude")).to_not have_content(spinner)
  end

  it "replaces the spinner with a map in the #map_canvas div" do
    expect(page.find("#map_canvas")).to have_content(map_div)
    expect(page.find("#map_canvas")).to have_content(cursor_url)
    expect(page.find("#map_canvas")).to_not have_content(spinner)
  end

end
