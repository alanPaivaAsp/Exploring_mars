# frozen_string_literal: true
module ExploringMars
  class Direction
    attr_reader :wind_rose_direction, :wind_rose_direction_axis_signal

    def initialize(initial_direction)
      @wind_rose_direction = initial_direction
      @wind_rose_direction_axis_signal = ExploringMars::Constants::DIRECTION_SIGNAL_MAP[@wind_rose_direction]
    end

    def left
      @wind_rose_direction = ExploringMars::Constants::DIRECTIONS_MAP[ExploringMars::Constants::DIRECTIONS_MAP.find_index(@wind_rose_direction) - 1]
      change_wind_rose_direction_axis_signal
    end

    def right
      @wind_rose_direction = ExploringMars::Constants::DIRECTIONS_MAP[ExploringMars::Constants::DIRECTIONS_MAP.find_index(@wind_rose_direction) + 1]
      change_wind_rose_direction_axis_signal
    end

    def short_term_direction
      ExploringMars::Constants::SHORT_TERM_DIRECTION_MAP[@wind_rose_direction]
    end

    private

    def change_wind_rose_direction_axis_signal
      @wind_rose_direction_axis_signal = ExploringMars::Constants::DIRECTION_SIGNAL_MAP[@wind_rose_direction]
    end
  end
end
