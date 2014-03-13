require 'piglatin'

describe PigLatin do
  
  describe '#translate' do
    
    it 'appends "ay" to words beginning with vowels' do
      pl = PigLatin.new
      pl.translate("apple").should eq "appleay"
    end

    it 'moves leading consonants to the end of the word, then appends "ay"' do
      pl = PigLatin.new
      pl.translate("hello").should eq "ellohay"
    end

    it 'should work with mixed case words' do
      pl = PigLatin.new
      pl.translate("Apple").should eq "Appleay"
      pl.translate("Hello").should eq "elloHay"
    end

    it 'should not change the case of any letters' do
      pl = PigLatin.new
      pl.translate("APPLE").should eq "APPLEay"
      pl.translate("HELLO").should eq "ELLOHay"
    end
  end
end