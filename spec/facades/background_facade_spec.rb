require 'rails_helper'

RSpec.describe BackgroundFacade do
  context 'instance methods' do
    context '#get_image' do
      it 'returns Image data', :vcr do
        location = 'denver,co'
        query = BackgroundFacade.new
        results = query.get_image(location)

        expect(results).to be_a(Image)
      end
    end
  end
end
