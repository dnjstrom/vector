require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Vector do
	before :each do
  	@v = Vector.new
	end

  it "initializes to a normalized vector" do
  	@v.length.should eq 1
  end

  it 'initializes to a vector with angle 0' do
  	@v.angle.should eq 0
  end

  it 'returns the correct x component of the vector' do
  	@v.x.should eq 1
  end

  it 'returns the correct y component of the vector' do
  	@v.y.should eq 0
  end

  it 'sets the vector to the correct x and y' do
  	@v.set 3, 4

  	@v.length.should eq 5
  	@v.angle.should be_within(0.01).of(53.13)
  end

  it 'sets the vectors individual components correctly' do
  	@v.x = 3
  	@v.x.should be_within(0.0000001).of(3)

  	@v.y = 4
  	@v.y.should be_within(0.0000001).of(4)
  end

  it 'can turn the vector using degrees' do
  	@v.turn 30
  	@v.angle.should eq 30
  end

  it 'can turn the vector using radians' do
  	@v.turn Math::PI, :rad
  	@v.angle.should eq 180
  end

  it 'two vectors can be added to each other' do
  	vv = Vector.new
  	vvv = @v + vv
  	vvv.length.should eq 2
  end

  it 'can be modified' do
  	@v.add(3, 4)
  	@v.x.should be_within(0.0000001).of(4)
  	@v.y.should be_within(0.0000001).of(4)
  end

  it 'can be normalized' do
  	@v.normalize
  	@v.length.should eq 1
  end

  it 'can be multiplied with a scalar' do
  	@v * 10
  	@v.length.should eq 10
  end
end
