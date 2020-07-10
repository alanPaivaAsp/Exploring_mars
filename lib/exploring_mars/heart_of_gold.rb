# frozen_string_literal: true
module ExploringMars
  class HeartOfGold
    def initialize(initial_position, initial_direction)
      @position = ExploringMars::Coordinate.new(initial_position)
      @direction = ExploringMars::Direction.new(initial_direction)
    end

    def move
      @position.forward(@direction)
    end

    def left
      @direction.left
    end

    def right
      @direction.right
    end

    def current_position
      "#{@position.x} #{@position.y} #{@direction.short_term_direction}"
    end
  end
end
