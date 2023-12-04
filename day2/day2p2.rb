
def main
  total = 0
  File.foreach('./input.txt') do |line|
    rounds = line.split(":")[1].split(";")
    puts "Rounds: #{rounds}"


    high_colors = {"red": 0, "green": 0, "blue": 0}

    rounds.each do |round|
      

      round.split(",").each do |pull|
        puts "Pull: #{pull}"
        possible = true
        data_color = pull.split(" ")
        data = data_color[0]
        color = data_color[1]
        # # puts "Data: #{data}"
        # puts "Color: #{color}"
        if data.to_i > high_colors[color.to_sym]
          high_colors[color.to_sym] = data.to_i
        end
      end


    end

    puts high_colors
    total += high_colors[:red] * high_colors[:blue] * high_colors[:green]
  end
  puts "Total: #{total}"
end

main()