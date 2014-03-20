require 'rspec'
require 'skip_encoding'

describe SkipDecoder do
  describe '#find' do

    it 'returns number of characters skipped between message characters' do
      sd = SkipDecoder.new
      sd.find("foo", "faaoaao").should eq 2
    end

    it 'returns nil for a string not found' do
      sd = SkipDecoder.new
      sd.find("foo", "bar").should be_nil
    end

    it 'returns nil for encoding with inconsistent n' do
      sd = SkipDecoder.new
      sd.find("foo", "faoaao").should be_nil
    end
  end
end