require 'rubymagica/version'
require 'rubymagica/game'
require 'rubymagica/time'
module Rubymagica
  class App
    def initialize
      @game = Rubymagica::Game.new
    end

    def start
      @game.show
    end
  end
end
