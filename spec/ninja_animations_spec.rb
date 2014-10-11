require_relative '../ninja'

describe NinjaAnimations do
  let(:window) { double 'Window' }
  let(:image) { double 'Image' }
  let(:second_image) { double 'Image' }
  let(:third_image) { double 'Image' }
  let(:fourth_image) { double 'Image' }
  let(:fifth_image) { double 'Image' }
  let(:ninja_animations) { NinjaAnimations.new window }

  before do
    allow(Gosu::Image).to receive(:new).and_return(image)
  end
  
  it "has a current image" do
    expect(ninja_animations.current_image).to be image
  end

  context "running" do

    before do
      ninja_animations.images[:running1] = second_image
      ninja_animations.images[:running2] = third_image
    end
    
    it "runs right" do
      allow(Gosu).to receive(:milliseconds).and_return 0
      ninja_animations.run_right
      expect(ninja_animations.current_image).to be second_image

      allow(Gosu).to receive(:milliseconds).and_return 76
      ninja_animations.run_right
      expect(ninja_animations.current_image).to be third_image
    end

    it "runs left" do
      allow(Gosu).to receive(:milliseconds).and_return 0
      ninja_animations.run_left
      expect(ninja_animations.current_image).to be second_image

      allow(Gosu).to receive(:milliseconds).and_return 76
      ninja_animations.run_left
      expect(ninja_animations.current_image).to be third_image
    end
  end
  
  it "stands still" do
    ninja_animations.images[:standing] = second_image
    ninja_animations.stand
    expect(ninja_animations.current_image).to be second_image
  end

  context 'jumping' do
    before do
      ninja_animations.images[:jumping1] = second_image
      ninja_animations.images[:jumping2] = third_image
      ninja_animations.images[:jumping3] = fourth_image
      ninja_animations.images[:jumping4] = fifth_image
    end
    
    it 'jump image 1' do
      allow(Gosu).to receive(:milliseconds).and_return 0
      ninja_animations.jump
      expect(ninja_animations.current_image).to be second_image
    end

    it 'jump image 2' do
      allow(Gosu).to receive(:milliseconds).and_return 51
      ninja_animations.jump
      expect(ninja_animations.current_image).to be third_image
    end

    it 'jump image 3' do
      allow(Gosu).to receive(:milliseconds).and_return 101
      ninja_animations.jump
      expect(ninja_animations.current_image).to be fourth_image
    end
    
    it 'jump image 4' do
      allow(Gosu).to receive(:milliseconds).and_return 151
      ninja_animations.jump
      expect(ninja_animations.current_image).to be fifth_image
    end
  end

  context 'attacking' do
    before do
      ninja_animations.images[:attacking1] = second_image
      ninja_animations.images[:attacking2] = third_image
      ninja_animations.images[:attacking3] = fourth_image
    end
    
    it 'attack image 1' do
      allow(Gosu).to receive(:milliseconds).and_return 0
      ninja_animations.attack
      expect(ninja_animations.current_image).to be second_image
    end

    it 'attack image 2' do
      allow(Gosu).to receive(:milliseconds).and_return 101
      ninja_animations.attack
      expect(ninja_animations.current_image).to be third_image
    end

    it 'attack image 3' do
      allow(Gosu).to receive(:milliseconds).and_return 201
      ninja_animations.attack
      expect(ninja_animations.current_image).to be fourth_image
    end
  end

  context 'jump attack' do
    before do
      ninja_animations.images[:fallingAttack1] = second_image
      ninja_animations.images[:fallingAttack2] = third_image
    end
    
    it 'falling attack image 1' do
      allow(Gosu).to receive(:milliseconds).and_return 0
      ninja_animations.jump_attack
      expect(ninja_animations.current_image).to be second_image
    end

    it 'falling attack image 2' do
      allow(Gosu).to receive(:milliseconds).and_return 101
      ninja_animations.jump_attack
      expect(ninja_animations.current_image).to be third_image
    end
  end

  context 'jump attack' do
    before do
      ninja_animations.images[:fallingAttack1] = second_image
      ninja_animations.images[:fallingAttack2] = third_image
    end
    
    it 'falling attack image 1' do
      allow(Gosu).to receive(:milliseconds).and_return 0
      ninja_animations.jump_attack
      expect(ninja_animations.current_image).to be second_image
    end

    it 'falling attack image 2' do
      allow(Gosu).to receive(:milliseconds).and_return 101
      ninja_animations.jump_attack
      expect(ninja_animations.current_image).to be third_image
    end
  end

  it "crouches" do
    ninja_animations.images[:ducking] = second_image
    ninja_animations.crouch
    expect(ninja_animations.current_image).to be second_image
  end

  context 'crouch attack' do
    before do
      ninja_animations.images[:duckingAttack1] = second_image
      ninja_animations.images[:duckingAttack2] = third_image
      ninja_animations.images[:duckingAttack3] = fourth_image
    end
    
    it "animation 1" do
      allow(Gosu).to receive(:milliseconds).and_return 0
      ninja_animations.crouch_attacking
      expect(ninja_animations.current_image).to be second_image
    end

    it "animation 2" do
      allow(Gosu).to receive(:milliseconds).and_return 101
      ninja_animations.crouch_attacking
      expect(ninja_animations.current_image).to be third_image
    end

    it "animation 1" do
      allow(Gosu).to receive(:milliseconds).and_return 201
      ninja_animations.crouch_attacking
      expect(ninja_animations.current_image).to be fourth_image
    end
  end
    
end
