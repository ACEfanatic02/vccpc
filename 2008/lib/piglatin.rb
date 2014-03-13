
class PigLatin

  def translate word
    ['a', 'e', 'i', 'u', 'o'].each do |vowel|
      if word[0].downcase == vowel
        return word + "ay"
      end
    end
    lead_char = word[0]
    word[1..word.length] + lead_char + "ay"
  end
end