require 'rspec'
require 'treasure'

describe TreasureMap do

  describe '#feed' do

    it 'returns resulting coords' do
      tm = TreasureMap.new
      tm.feed("3 E").should eq [3, 0]
      tm.feed("5 N").should eq [3, 5]
    end

    it 'accumulates over several calls' do
      tm = TreasureMap.new
      tm.feed("3 N")
      tm.feed("1 E")
      tm.feed("1 N")
      tm.feed("3 E")
      tm.feed("2 S")
      tm.feed("1 W")
      tm.pos.should eq [3, 2]
    end
  end

  describe '#distance' do 

    it 'returns linear distance from origin to position' do
      tm = TreasureMap.new
      tm.feed("10 E")
      tm.distance.should eq 10
      tm = TreasureMap.new
      tm.feed("3 N")
      tm.feed("1 E")
      tm.feed("1 N")
      tm.feed("3 E")
      tm.feed("2 S")
      tm.feed("1 W")
      tm.distance.should eq 3.606
    end
  end
end