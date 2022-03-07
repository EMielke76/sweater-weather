require 'rails_helper'

RSpec.describe Book do
  let!(:attributes) {
      {
        title: "Denver",
        publisher: [
                    "Crescent Books",
                    "Random House Value Publishing",
                    "Distributed by Crown Publishers",
                    "Crescent"
                ],
        isbn: [
                    "0517215039",
                    "9780517623619",
                    "9780517215036",
                    "0517623617"
                ]
      }
    }

  let!(:book) { Book.new(attributes) }

  it 'exists'do
    expect(book).to be_a(Book)
  end

  it 'has attributes' do
    expect(book.title).to eq("Denver")
    expect(book.publisher).to eq(["Crescent Books", "Random House Value Publishing", "Distributed by Crown Publishers", "Crescent"])
    expect(book.isbn).to eq(["0517215039", "9780517623619", "9780517215036", "0517623617"])
  end
end
