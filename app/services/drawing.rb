class Drawing

  def self.erections
    ErectionDrawing.all
  end

  def self.find(id)
    ErectionDrawing.find(id)
  end

end
