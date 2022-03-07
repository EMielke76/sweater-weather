require 'rails_helper'

RSpec.describe LibraryFacade do
  context 'instance methods' do
    context '#get_books' do
      it 'returns Book data', :vcr do
        location = "denver,co"
        quantity = 5
        query = LibraryFacade.new
        results = query.get_books(location, quantity)

        expect(results).to be_a(Hash)
        expect(results).to have_key(:numFound)
        expect(results[:numFound]).to be_a(Integer)

        expect(results).to have_key(:docs)
        expect(results[:docs]).to be_a(Array)
        expect(results[:docs].count).to eq(quantity)

        book = results[:docs].first
        expect(book).to have_key(:title)
        expect(book[:title]).to be_a(String)

        expect(book).to have_key(:isbn)
        expect(book[:isbn]).to be_a(Array)
        book[:isbn].each do |num|
          expect(num).to be_a(String)
        end

        expect(book).to have_key(:publisher)
        expect(book[:publisher]).to be_a(Array)
        book[:publisher].each do |pub|
          expect(pub).to be_a(String)
        end
      end
    end

    context '#total_books_found' do
      it 'returns the number of books found', :vcr do
        location = "denver,co"
        quantity = 5
        query = LibraryFacade.new
        results = query.total_books_found(location, quantity)

        expect(results).to be_a(Integer)
      end
    end

    context '#make_books' do
      it 'returns Book data', :vcr do
        location = "denver,co"
        quantity = 5
        query = LibraryFacade.new
        results = query.make_books(location, quantity)

        expect(results).to be_a(Array)
        results.each do |result|
          expect(result).to be_a(Book)
        end 
      end
    end
  end
end
