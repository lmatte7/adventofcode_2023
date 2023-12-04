require_relative '../tools.rb'


def main
  total = 0
  File.foreach('./input.txt') do |line|
    number = line.gsub(/[^\d]+/, '')
    total += (number[0] + number[-1]).to_i
  end
  puts total
end

main()