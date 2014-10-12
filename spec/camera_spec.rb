require_relative '../camera'

describe Camera do
  let(:camera) { Camera.instance }
  let(:image_width) { 46 }
  let(:image) { double 'Image', width: image_width }
  let(:ninja_animations) { double 'NinjaAnimations', current_image: image, stand: nil, reset_timer: nil }
  let(:ninja) { Ninja.new ninja_animations }
  
  it 'has a position' do
    expect(camera.x).to be 0
    expect(camera.y).to be 0
  end

  it 'updates' do
    allow(Gosu).to receive(:screen_width).and_return 50
    allow(Gosu).to receive(:screen_height).and_return 50
    ninja.x = 1000
    ninja.y = 1000
    camera.ninja = ninja
    camera.update
    expect(camera.x).to eq 975
    expect(camera.y).to eq 975    
  end
end
