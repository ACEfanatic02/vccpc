ALPHABET = "abcdefghijklmnopqrstuvwxyz"

def classify word
  seen_letters = ""

  word.downcase.each_char do |c|
    unless seen_letters.index c
      seen_letters << c
    end
  end

  word.tr(seen_letters, ALPHABET)
end