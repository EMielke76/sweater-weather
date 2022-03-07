class Book
  attr_reader :title,
              :publisher,
              :isbn
  def initialize(attributes)
    @title = attributes[:title]
    @publisher = attributes[:publisher]
    @isbn = attributes[:isbn]
  end
end
