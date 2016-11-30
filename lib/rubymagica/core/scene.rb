module Rubymagica
  class Scene
    def on_begin; end
    def on_end; end

    def update(dt); end
    def change_scene?; end
    def draw(width, height); end
  end
end
