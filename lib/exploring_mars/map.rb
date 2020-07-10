# frozen_string_literal: true
require 'singleton'

module ExploringMars
  class Map
    include Singleton
    attr_accessor :map_size
    @@map_size = {}

    def self.map_size=(mz)
      @@map_size = mz
    end

    def initialize
      @map_size = @@map_size
    end

    def exceeded_boundary?(axis, signal, position)
      current_position = axis == :x_axis ? position[:x] : position[:y]

      next_position = current_position + signal

      return next_position < 0 if signal.negative?

      return next_position > @map_size[:x] if axis == :x_axis

      next_position > @map_size[:y]
    end
  end
end
