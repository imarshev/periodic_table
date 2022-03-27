require_relative "lib/table"
require_relative "lib/element"

elements = Element.get_elements(File.join(__dir__, "data/table.json"))
table = Table.new(elements)

puts <<~HEADER
🔬 Периодическая система химических элементов (Таблица Менделеева)
О каком элементе хотите узнать?

#{table}
HEADER

user_choice = gets.chomp
puts table.about_element(user_choice)
