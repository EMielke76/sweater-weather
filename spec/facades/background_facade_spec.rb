require 'rails_helper'

RSpec.describe BackgroundFacade do
  context 'class methods' do
    context '::get_image' do
      it 'returns Image data', :vcr do
        location = 'denver,co'
        results = BackgroundFacade.get_image(location)

        expect(results).to be_a(Image)
      end
    end
  end
end
