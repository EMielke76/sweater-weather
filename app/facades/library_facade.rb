class LibraryFacade

  def get_books(location, quantity)
    service.get_books(location, quantity)
  end

  def total_books_found(location, quantity)
    get_books(location, quantity)[:numFound]
  end

  def make_books(location, quantity)
    get_books(location, quantity)[:docs].map do |doc|
      Book.new(doc)
    end
  end

  private
  def service
    LibraryService.new
  end
end
