class Tokenizer

  def initialize string
    @tokens = string.split
  end

  def each
    @tokens.each do |token|
      yield token
    end
  end
end