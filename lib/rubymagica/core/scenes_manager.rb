module Rubymagica
  class ScenesManager
    def initialize(scenes: [], on_finish_event: -> {})
      @scenes_stack = scenes
      @on_finish_event = on_finish_event
    end

    def update(*data)
      if @scenes_stack.empty?
        on_finish unless finalized?
        return
      end

      handle_scenes_change

      last_scene&.update(*data)
    end

    def draw(*data)
      return if finished?
      last_scene.draw(*data)
    end

    def scenes_count
      @scenes_stack.size
    end

    def finished?
      scenes_count == 0
    end

    private

    def finalized?
      @finalized == true
    end

    def handle_scenes_change
      return :unchanged if @scenes_stack.empty?

      decision = @scenes_stack.last.change_scene? || {}
      if decision.include? :pop
        @scenes_stack.pop.on_end
      elsif decision.include? :push
        scene = decision[:push]
        scene.on_begin
        @scenes_stack.push(scene)
      end

      return :changed
    end

    def last_scene
      @scenes_stack.last
    end

    def on_finish
      @finalized = true
      @on_finish_event.call
    end
  end
end
