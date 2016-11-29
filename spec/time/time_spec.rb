require 'spec_helper'
require 'rubymagica/time/time'

describe Rubymagica::Time do
  let(:time) { Rubymagica::Time }
  it 'gives delta eq to 0 at the very beggining' do
    expect(time.delta).to eq 0
  end

  it('gives proper delta when updates are called') do
    time.update 1
    expect(time.delta).to eq 1

    time.update 5
    expect(time.delta).to eq 4

    time.update 10
    expect(time.delta).to eq 5
  end

  it('can flawlessly reset') do
    time.reset
    expect(time.delta).to eq 0
  end
end
