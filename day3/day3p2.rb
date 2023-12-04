require_relative '../tools'

def main
  total = 0

  map = process_array

  map.each_with_index do |row_chars, row|
    row_chars.each_with_index do |char, column|
      number_count = 0
      numbers = []
      if char =~ /[^\d\w^.]/
        # Check adjacent spots for a number

        debug "\n"
        number = ""
        # top left
        result = check_for_number(row-1,column-1,map, char)
        numbers << result if result != 0
        number_count += 1 if result != 0
        # top 
        result = check_for_number(row-1,column,map, char)
        numbers << result if result != 0
        number_count += 1 if result != 0
        # top right
        result = check_for_number(row-1,column+1,map, char)
        numbers << result if result != 0
        number_count += 1 if result != 0

        # left
        result = check_for_number(row,column-1,map, char)
        numbers << result if result != 0
        number_count += 1 if result != 0
        # right
        result = check_for_number(row,column+1,map, char)
        numbers << result if result != 0
        number_count += 1 if result != 0

        # bottom left
        result = check_for_number(row+1,column-1,map, char)
        numbers << result if result != 0
        number_count += 1 if result != 0
        # bottom 
        result = check_for_number(row+1,column,map, char)
        numbers << result if result != 0
        number_count += 1 if result != 0
        # bottom right
        result = check_for_number(row+1,column+1,map, char)
        numbers << result if result != 0
        number_count += 1 if result != 0

        if number_count == 2
          total += numbers[-1] * numbers[-2]
        end
        
      end
    end
  end

  puts "\n"
  puts "Total: #{total}"
end

def check_for_number(row_start, col_start, map, char)
  number = ""
  if map[row_start][col_start] =~ /\d/
    while map[row_start][col_start+1] =~ /\d/
      col_start += 1
    end
    number = find_number(row_start, col_start, map, "")
    debug "Found number #{number.reverse} at #{char}"
  end
  number.reverse.to_i
end

def find_number(row_start, col_start, map, number)
  number += map[row_start][col_start]
  map[row_start][col_start] = "."
  unless map[row_start][col_start-1] =~ /\d/
    return number
  end
  find_number(row_start, col_start-1, map, number)
end


def process_array

  map = []

  File.foreach('./input.txt') do |line|
    map << line.gsub(/\n/,'').split('')
  end

  map
end

def print_map(map)
  map.each do |row|
    row.each do |char|
      print char
    end
    debug "\n"
  end
end

main()