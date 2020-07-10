# frozen_string_literal: true
module ExploringMars
  class FormattedInput
    def self.format(input)
      formatting_input = input.split("\n")
      map_size = formatting_input.first.split(' ')

      formatting_input.shift(1).to_ary

      formatted_input = {}
      formatted_input[:map_size] = { x: map_size.first.to_i, y: map_size.last.to_i }
      formatted_input[:spacecrafts] = []

      formatting_input.each_slice(2) do |spacecraft_instruction|
        initial_position = spacecraft_instruction.first.split(' ')
        initial_direction = initial_position.last

        formatted_input[:spacecrafts] << {
          initial_position: { x: initial_position.first.to_i, y: initial_position[1].to_i },
          instructions: spacecraft_instruction.last,
          initial_direction: ExploringMars::Constants::SHORT_TERM_DIRECTION_MAP.key(initial_direction),
        }
      end

      formatted_input
    end
  end
end
