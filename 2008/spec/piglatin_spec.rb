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
  end
end