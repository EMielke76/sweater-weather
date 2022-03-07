class Book
  attr_reader :id,
              :title,
              :publisher,
              :isbn
  def initialize(attributes)
    @id = nil
    @title = attributes[:title]
    @publisher = attributes[:publisher]
    @isbn = attributes[:isbn]
  end 
end
