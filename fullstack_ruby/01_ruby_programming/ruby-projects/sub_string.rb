dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"];

def substrings(string, dictionary)
  string_splitted = string.split(" ")
  result = {};
  string_splitted.each do |element|
    dictionary.each do |word|
      if element.downcase.include?(word)
        result[word] = 0 unless result.has_key?(word)
        result[word] += 1
      end
    end
  end
  return result
end

p substrings("Howdy partner, sit down! How's it going?", dictionary)