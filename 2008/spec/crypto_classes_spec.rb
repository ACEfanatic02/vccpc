require 'rspec'
require 'crypto_classes'

describe '#classify' do

  it 'maps characters in word based on order' do
    classify('bar').should eq 'abc'
    classify('foo').should eq 'abb'
    classify('moon').should eq 'abbc'
  end

  it 'maps equivalent word patterns to same string' do
    classify('bar').should eq classify('baz')
    classify('well').should_not eq classify('that')
  end

  it 'ignores case in the translation' do
    classify('YABBA').should eq 'abccb'
    classify('YABBA').should eq classify('DABBA')
  end
end

describe '#classify_sentence' do

  it 'returns a map from word patterns to words' do
    expected = { 
      "abb" => ["foo"],
      "abc" => ["bar", "baz"]
    }
    classify_sentence('foo bar baz').should eq expected
  end

  it 'returns map with words in original case' do
    expected = {
      'abccb' => ['YABBA', 'DABBA']
    }
    classify_sentence('YABBA DABBA').should eq expected
  end
end