require_relative '../ninja'

describe Ninja do
  let(:image_width) { 46 }
  let(:image) { double 'Image', width: image_width }
  let(:ninja_animations) { double 'NinjaAnimations', current_image: image, stand: nil, reset_timer: nil }
  let(:ninja) { Ninja.new ninja_animations }
  
  context 'drawing' do
    before do
      expect(ninja.animations).to receive(:current_image).and_return(image)      
    end

    it 'facing right' do
      expect(image).to receive(:draw).with(ninja.x, ninja.y, 1, 1)
      ninja.draw
    end

    it 'facing left' do
      ninja.facing = :left
      expect(image).to receive(:draw).with(ninja.x + image_width, ninja.y, 1, -1)
      ninja.draw
    end

    it 'changes the y when it ducks' do
      ninja.state = Crouching.new ninja
      expect(image).to receive(:draw).with(ninja.x, ninja.y + 20, 1, 1)
      ninja.draw

      ninja.state = CrouchingAttacking.new ninja
      expect(image).to receive(:draw).with(ninja.x, ninja.y + 20, 1, 1)
      ninja.draw

    end

  end
  
  it 'falls' do
    expect(ninja.y).to eq(100)
    ninja.fall(0.01)
    expect(ninja.y).to eq(107.2)
  end

  it 'lands on the ground' do
    expect(ninja.y).to eq(100)
    ninja.update(5)
    expect(ninja.y).to eq(325)
  end

  it 'can jump' do
    ninja.y = 325
    ninja.jump(0.01)
    expect(ninja.y).to be < 325
  end

  it 'can move right' do
    expect(ninja.x).to eq(100)
    ninja.move_right(0.01)
    expect(ninja.x).to eq(102.4)
    expect(ninja.facing).to eq(:right)
  end


  it 'can move left' do
    expect(ninja.x).to eq(100)
    ninja.move_left(0.01)
    expect(ninja.x).to eq(97.6)
    expect(ninja.facing).to eq(:left)
  end

  context 'it can try to transition' do
    it 'to jump' do
      expect(ninja.state).to receive(:jump)
      ninja.try_jumping
    end

    it 'to run right' do
      expect(ninja.state).to receive(:right)
      ninja.try_running_right
    end

    it 'to run left' do
      expect(ninja.state).to receive(:left)
      ninja.try_running_left
    end

    it 'to attack' do
      expect(ninja.state).to receive(:attack)
      ninja.try_attacking
    end

    it 'to crouch' do
      expect(ninja.state).to receive(:crouch)
      ninja.try_crouching
    end

    it 'to stop crouching' do
      expect(ninja.state).to receive(:stop_crouching)
      ninja.stop_crouching
    end

    it 'to stand stidd' do
      expect(ninja.state).to receive(:no_right_or_left)
      ninja.try_standing_still
    end
  end

  it 'will attack' do
    expect(ninja.state).to receive(:stop_attacking)
    ninja.attack 1
  end
end
