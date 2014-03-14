require 'rspec'
require 'crypto_classes'

describe '#classify' do

  it 'maps characters in word based on order' do
    classify('bar').should eq 'abc'
    classify('foo').should eq 'abb'
    classify('moon').should eq 'abbc'
  end

  it 'maps equivelent word patterns to same string' do
    classify('bar').should eq classify('baz')
  end
end