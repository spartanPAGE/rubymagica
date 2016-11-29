require 'gosu'

module Rubymagica
  class Game < Gosu::Window
    def initialize(deltaTimeProvider: Game::Time.new)
      super(640, 480)
      self.caption = 'Hello world!'
    end

    def update(clock=Time)
    end

    def draw
    end
  end
end
