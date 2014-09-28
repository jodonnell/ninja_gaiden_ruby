require_relative '../game'
require_relative '../ninja'

describe Game do
  let(:window) { double 'Window' }
  let(:image) { double 'Image', draw: nil }
  let(:ninja) { Ninja.new image }
  
  it "can create a new game" do
    allow(Ninja).to receive_messages(:create_with_sprite => ninja)
    game = Game.new(window)
    game.update
    game.draw
  end
end
