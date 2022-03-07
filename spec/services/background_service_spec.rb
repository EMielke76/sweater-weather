require 'rails_helper'

RSpec.describe BackgroundService do
  context 'instance methods' do
    context '#get_image' do
      it 'returns image data' do
        VCR.use_cassette('-denver-image-search') do
          location = "denver,co"
          query = BackgroundService.new
          results = query.get_image(location)

          expect(results).to be_a(Hash)
          expect(results).to have_key(:photos)
          expect(results[:photos]).to be_a(Array)

          photo = results[:photos].first

          expect(photo).to have_key(:url)
          expect(photo[:url]).to be_a(String)

          expect(photo).to have_key(:photographer)
          expect(photo[:photographer]).to be_a(String)

          expect(photo).to have_key(:photographer_url)
          expect(photo[:photographer_url]).to be_a(String)
        end
      end
    end
  end
end
