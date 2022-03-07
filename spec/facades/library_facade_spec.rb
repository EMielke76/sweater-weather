require 'rails_helper'

RSpec.describe LibraryFacade do
  context 'instance methods' do
    context '#get_books' do
      it 'returns Book data', :vcr do
        location = "denver,co"
        quantity = 5
        query = LibraryFacade.new
        results = query.get_books(location, quantity)

        expect(results).to be_a(Array)
        results.each do |result|
          expect(result).to be_a(Book)
        end 
      end
    end
  end
end
