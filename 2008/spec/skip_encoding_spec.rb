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

    it 'finds a string in itself' do
      sd = SkipDecoder.new
      sd.find('foo', 'foo').should eq 0
    end

    it 'does not find a string in wrong case' do
      sd = SkipDecoder.new
      sd.find('Foo', 'faaoaao').should be_nil
    end
  end

  describe '#test' do

    it 'returns whether a given n produces the needle from the haystack' do
      sd = SkipDecoder.new
      sd.test('foo', 'foo', 0).should be_true
      sd.test('foo', 'faaoaao', 1).should be_false
      sd.test('foo', 'faaoaao', 2).should be_true
    end
  end
end