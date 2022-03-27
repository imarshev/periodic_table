require "json"
class Element
  attr_reader :symbol, :xpos, :ypos

  def self.get_elements(path)
    table = JSON.parse(File.read(path))
    table["elements"].map do |element|
      new(
        element["number"],
        element["name"],
        element["discovered_by"],
        element["density"],
        element["symbol"],
        element["xpos"],
        element["ypos"])
    end
  end

  def initialize(number, name, discovered_by, density, symbol, xpos, ypos)
    @number = number
    @name = name
    @discovered_by = discovered_by
    @density = density
    @symbol = symbol
    @xpos = xpos
    @ypos = ypos
  end

  def to_s
    <<~ELEMENT
      Порядковый номер: #{@number}
      Название: #{@name}
      Первооткрыватель: #{@discovered_by}
      Плотность: #{@density} г/см³
    ELEMENT
  end
end
