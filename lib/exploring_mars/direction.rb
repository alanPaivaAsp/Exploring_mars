# frozen_string_literal: true
module ExploringMars
  class Direction
    attr_reader :wind_rose_direction, :wind_rose_direction_axis_signal

    def initialize(initial_direction)
      @wind_rose_direction = initial_direction
      @wind_rose_direction_axis_signal = ExploringMars::Constants::DIRECTION_SIGNAL_MAP[@wind_rose_direction]
    end

    def left
      @wind_rose_direction = directions_map[directions_map.find_index(@wind_rose_direction) - 1]
      change_wind_rose_direction_axis_signal
    end

    def right
      direction = directions_map[directions_map.find_index(@wind_rose_direction) + 1]
      new_direction = direction.nil? ? directions_map.first : direction

      @wind_rose_direction = new_direction

      change_wind_rose_direction_axis_signal
    end

    def short_term_direction
      ExploringMars::Constants::SHORT_TERM_DIRECTION_MAP[@wind_rose_direction]
    end

    private

    def change_wind_rose_direction_axis_signal
      @wind_rose_direction_axis_signal = ExploringMars::Constants::DIRECTION_SIGNAL_MAP[@wind_rose_direction]
    end

    def directions_map
      ExploringMars::Constants::DIRECTIONS_MAP
    end
  end
end
