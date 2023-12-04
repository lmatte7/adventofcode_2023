require_relative '../tools.rb'


def main
  total = 0
  line_num = 0
  File.foreach('./input.txt') do |line|

    buffer = ""
    numbers = ""
    line.split('').each_with_index do |n, i|
      buffer += n
      case buffer
      when /one/
        numbers += "1"
        buffer = "e"
      when /two/
        numbers += "2"
        buffer = "o"
      when /three/
        numbers += "3"
        buffer = "e"
      when /four/
        numbers += "4"
        buffer = "r"
      when /five/
        numbers += "5"
        buffer = "e"
      when /six/
        numbers += "6"
        buffer = "x"
      when /seven/
        numbers += "7"
        buffer = "n"
      when /eight/
        numbers += "8"
        buffer = "t"
      when /nine/
        numbers += "9"
        buffer = "e"
      when /\d+/
        numbers += n
        buffer = ""
      when /[^\d\n]*\n/ 
        numbers = numbers.gsub(/[^\d]+/, '')
        total += (numbers[0] + numbers[-1]).to_i
        buffer = ""
      end
    end
    line_num += 1
  end
  puts "\n"
  puts "Total: " + total.to_s
end

main()

