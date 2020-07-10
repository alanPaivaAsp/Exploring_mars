# frozen_string_literal: true
module ExploringMars
  class Constants
    AXIS_MAP = {
      x_axis: [:north, :south],
      y_axis: [:east, :west],
    }

    DIRECTIONS_MAP = [
      :north,
      :east,
      :south,
      :west,
    ]

    DIRECTION_SIGNAL_MAP = {
      north: 1,
      east: 1,
      south: -1,
      west: -1,
    }

    SHORT_TERM_DIRECTION_MAP = {
      north: 'N',
      east: 'E',
      south: 'S',
      west: 'W',
    }
  end
end
