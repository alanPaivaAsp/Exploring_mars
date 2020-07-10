# frozen_string_literal: true
module ExploringMars
  class Coordinate
    attr_reader :position

    def initialize(initial_position)
      @position = initial_position
    end

    def forward(direction)
      axis = ExploringMars::Constants::AXIS_MAP
        .select { |key| ExploringMars::Constants::AXIS_MAP[key].include?(direction.wind_rose_direction) }
        .keys
        .first

      return if ExploringMars::Map.instance
        .exceeded_boundary?(axis, direction.wind_rose_direction_axis_signal, @position)

      @position[:x] += direction.wind_rose_direction_axis_signal if axis == :x_axis
      @position[:y] += direction.wind_rose_direction_axis_signal if axis == :y_axis
    end

    def x
      @position[:x]
    end

    def y
      @position[:y]
    end
  end
end
