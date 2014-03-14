require 'tokenizer'

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

def classify_sentence sentence
  map = Hash.new { |hash, key| hash[key] = [] }
  Tokenizer.new(sentence).each do |token|
    key = classify(token)
    map[key] << token
  end
  map.default = nil
  map
end