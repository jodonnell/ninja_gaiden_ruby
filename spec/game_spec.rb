require_relative '../game'
require_relative '../ninja'
require_relative '../stage'

describe Game do
  let(:window) { double 'Window' }
  let(:image) { double 'Image', draw: nil, width: 46 }
  let(:stage) { Stage.new image }
  let(:ninja_animations) { double('NinjaAnimations', current_image: image, reset_timer: nil) }
  
  before do
    allow(NinjaAnimations).to receive(:new).and_return(ninja_animations)
    allow(Stage).to receive_messages(:create_with_sprite => stage)
    @game = Game.new(window)
  end
  
  it "draws" do
    expect(@game.ninja).to receive(:draw)
    expect(stage).to receive(:draw)
    @game.draw
  end

  it "updates" do
    expect(@game.ninja).to receive(:update)
    @game.update
  end
  
  it "to have a stage" do
    expect(@game.stage).to be stage
  end

  it "has time since last update" do
    expect(@game.stage).to be stage
  end
end
