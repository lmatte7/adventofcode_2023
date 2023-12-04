
def main
  total = 0
  game_id = 1
  File.foreach('./input.txt') do |line|
    round_possible = true
    rounds = line.split(":")[1].split(";")
    debug "Rounds: #{rounds}"

    max_colors = {"red": 12, "green": 13, "blue": 14}

    rounds.each do |round|
      
      round.split(",").each do |pull|
        debug "Pull: #{pull}"
        possible = true
        data_color = pull.split(" ")
        data = data_color[0]
        color = data_color[1]
        debug "Data: #{data}"
        debug "Color: #{color}"
        if data.to_i > max_colors[color.to_sym]
          round_possible = false
          break
        end
      end


    end
    if round_possible
      total += game_id
    end
    game_id += 1
  end
  puts "Total: #{total}"
end

main()