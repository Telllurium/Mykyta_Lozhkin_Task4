def roman_to_int(roman)
  roman_numerals = { 'I' => 1, 'V' => 5, 'X' => 10, 'L' => 50, 'C' => 100, 'D' => 500, 'M' => 1000 }
  result, prev_value = 0, 0

  roman.reverse.each_char do |char|
    value = roman_numerals[char]
    return "Неправильний символ: #{char}" if value.nil?

    value < prev_value ? result -= value : result += value
    prev_value = value
  end
  result
end

def int_to_roman(num)
  return '' if num <= 0 || num >= 4000
  roman_numerals = { 1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD', 100 => 'C', 90 => 'XC', 50 => 'L', 40 => 'XL', 10 => 'X', 9 => 'IX', 5 => 'V', 4 => 'IV', 1 => 'I' }
  result = ''

  roman_numerals.keys.each do |value|
    while num >= value
      result += roman_numerals[value]
      num -= value
    end
  end
  result
end

loop do
  puts "Введіть римську цифру або число (1-3999):"
  input = gets.chomp
  if input.match?(/^[IVXLCDM]+$/i)
    puts "Результат: #{roman_to_int(input)}"
  elsif (1..3999).cover?(input.to_i)
    puts "Результат: #{int_to_roman(input.to_i)}"
  else
    puts "Неправильний формат вводу. Спробуйте ще раз."
  end
end