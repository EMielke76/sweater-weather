class LibraryFacade

  def get_books(location, quantity)
    service.get_books(location, quantity)[:docs].map do |doc|
      Book.new(doc)
    end
  end

  private
  def service
    LibraryService.new
  end
end
