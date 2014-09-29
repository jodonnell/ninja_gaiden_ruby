require_relative '../game'
require_relative '../ninja'
require_relative '../stage'

describe Game do
  let(:window) { double 'Window' }
  let(:image) { double 'Image', draw: nil }
  let(:ninja) { Ninja.new image }
  let(:stage) { Stage.new image }

  before do
    allow(Ninja).to receive_messages(:create_with_sprite => ninja)
    allow(Stage).to receive_messages(:create_with_sprite => stage)
    @game = Game.new(window)
  end
  
  it "can create a new game" do
    @game.update
    @game.draw
  end

  it "draws" do
    expect(ninja).to receive(:draw)
    expect(stage).to receive(:draw)
    @game.draw
  end

  it "updates" do
    expect(ninja).to receive(:update)
    @game.update
  end
  
  it "to have a stage" do
    expect(@game.stage).to be stage
  end

  it "has time since last update" do
    expect(@game.stage).to be stage
  end

end
