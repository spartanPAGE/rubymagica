require 'spec_helper'
require 'rubymagica/core/scenes_manager'
require 'rubymagica/core/scene'

class EmptyScene < Rubymagica::Scene
  attr_reader :updated, :drawn
  def update(*anthing)
    @updated = true
  end

  def draw(*anthing_really)
    @drawn = true
  end
end

class PoppingScene < Rubymagica::Scene
  def change_scene?
    return {pop: nil}
  end
end

describe Rubymagica::ScenesManager do
  it 'calls proper methods on the last scene' do
    scene = EmptyScene.new
    manager = Rubymagica::ScenesManager.new(scenes: [scene])
    manager.update
    expect(scene.updated).to eq true

    manager.draw
    expect(scene.drawn).to eq true
  end

  it 'pops nicely' do
    manager = Rubymagica::ScenesManager.new(scenes: [PoppingScene.new])
    manager.update

    expect(manager.scenes_count).to eq 0
    expect(manager.finished?).to eq true
  end

  #TODO: test scenes pushing
end
