require 'gosu'
require 'rubymagica/time/time'
module Rubymagica
  class TickingWindow < Gosu::Window
    attr_reader :clock, :scenes_stack

    def initialize(scenes: [], clock: Game::Time)
      super(640, 480)
      @clock = clock
      @scenes_stack = scenes
      self.caption = 'Hello world!'
    end

    def update
      @clock.update Gosu.milliseconds
      @scenes_stack.last.update(@clock.delta)
      if :no_more_scenes == handle_scenes_change
        close
      end
    end

    def handle_scenes_change
      return :no_more_scenes if @scenes_stack.empty?

      decision = @scenes_stack.last.change_scene?
      if decision.include? :pop
        @scenes_stack.pop.on_end
      elsif decision.include? :push
        scene = decision[:push]
        scene.on_begin
        @scenes_stack.push(scene)
      end
    end

    def draw
      @scenes_stack.last.draw(width, height)
    end
  end
end
