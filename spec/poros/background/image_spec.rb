require 'rails_helper'

RSpec.describe Image do
  let!(:attributes) {
      {
        url: "https://www.pexels.com/photo/red-and-white-concrete-building-during-night-time-3751010/",
        photographer: "Colin Lloyd",
        photographer_url: "https://www.pexels.com/@colin-lloyd-2120291",
      }
    }
  let!(:photo) { Image.new(attributes) }

  it 'exists' do
    expect(photo).to be_a(Image)
  end

  it 'has attributes' do
    expect(photo.url).to eq("https://www.pexels.com/photo/red-and-white-concrete-building-during-night-time-3751010/")
    expect(photo.photographer).to eq("Colin Lloyd")
    expect(photo.photographer_url).to eq("https://www.pexels.com/@colin-lloyd-2120291")
  end
end
