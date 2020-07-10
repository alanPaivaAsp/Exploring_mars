# frozen_string_literal: true
require 'pry'

Dir[File.join(__dir__, 'exploring_mars', '*.rb')].each { |file| require file }

module ExploringMars
  class Error < StandardError; end

  puts("First of all, I have to say that the answer of everything is 42. Actually, I should have presented my self \
before everything, but it doesn't matter after all... Well, My name is Marvin...")
  puts("Now, let's start our nonsence, boring exploration in Mars. \
I warn that is a waste of time going out there...")
  puts("Oh, I almost forgot... I need the land size, our current location in the map and instructions to move our \
spacecraft over the land: ")
  all_text = ""
  all_text2 = all_text.dup
  while (text = gets) != "\n"
    all_text2 << text
  end

  formatted_input = ExploringMars::FormattedInput.format(all_text2)

  ExploringMars::Map.map_size = formatted_input[:map_size]

  outputs = []

  formatted_input[:spacecrafts].each do |spacecraft|
    heart_of_gold = ExploringMars::HeartOfGold.new(spacecraft[:initial_position], spacecraft[:initial_direction])

    spacecraft[:instructions].split('').each do |instruction|
      if instruction == 'L'
        heart_of_gold.left
      end
      if instruction == 'R'
        heart_of_gold.left
      end
      if instruction == 'M'
        heart_of_gold.move
      end
    end

    outputs << heart_of_gold.current_position
  end

  outputs.each do |output|
    puts output
  end
end
