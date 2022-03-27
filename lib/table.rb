require_relative "element"

class Table
  def initialize(elements)
    @elements = elements
    @table = Array.new(10) {Array.new(18)}
    elements.each { |element| @table[element.ypos - 1][element.xpos - 1] = element.symbol}
  end

  def about_element(symbol)
    chosed_element = @elements.select { |element| element.symbol.downcase == symbol.downcase}[0]
    if !chosed_element.nil?
      chosed_element.to_s
    else
      "Элемента с таким символом нет в таблице. Ты открыл новый или просто опечатался?"
    end
  end

  def to_s
    @table.map do |row|
      row.map do |element|
        if !element.nil?
          if element.length == 1
            "#{element} "
          else
            element
          end
        else
          "  "
        end
      end.join(" ")
    end.join("\n")
  end
end
