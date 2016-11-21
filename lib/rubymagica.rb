require 'rubymagica/version'
require 'gosu'

module Rubymagica
  class App < Gosu::Window
    def initialize
      super(640, 480)
      self.caption = 'Hello world!'
    end
  end
end
