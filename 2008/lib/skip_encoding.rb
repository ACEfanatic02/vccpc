class SkipDecoder

  def find needle, haystack
    start = haystack.index needle[0]
    return nil unless start

    max_n = ((haystack.length - start) / needle.length) + 1
    max_n.times do |n|
      found = test(needle, haystack[start..haystack.length], n)
      return n if found
    end
    nil
  end

  def test needle, haystack, n
    needle.length.times do |i|
      return false unless (needle[i] == haystack[i * (n + 1)])
    end
    true
  end
end