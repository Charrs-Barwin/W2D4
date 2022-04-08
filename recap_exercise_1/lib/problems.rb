# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 

def all_vowel_pairs(words)
    pairs = []
    words[0...-1].each_with_index{ |w1,i1| words[i1+1..-1].each_with_index{ |w2,i2| pairs<<[w1,w2].join(" ") if all_vowels?([w1,w2].join) } }
    pairs
end

def all_vowels?(str)
    ['a','e','i','o','u'].all?{|v|str.include?(v)}
end

# Example:
# p all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]

# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself

def composite?(num)
    (2...num).any?{|n|num%n==0}
end

# Example:
# p composite?(9)     # => true
# p composite?(13)    # => false

# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.

def find_bigrams(str, bigrams)
    bigrams.select{|b|str.include?(b)}
end

# Examples:
# p find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# p find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.

    def my_select(&prc)
        h = {}
        self.each{|k,v|h[k]=v if prc && prc.call(k,v) || !prc && k==v}
        h
    end
end
    
# Examples:
# hash_1 = {x: 7, y: 1, z: 8}
# p hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}

# hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
# p hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
# p hash_2.my_select                            # => {4=>4}

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.

    def substrings(n = nil)
        return (1..self.size).map{|num|self.substrings(num)}.flatten if !n
        self[0..-n].chars.map.with_index{|c,i1|(1...n).inject(c){|acc,i2|acc + self[i1+i2]}}
    end

    # Examples:
    
    # p "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # p "cats".substrings(2)  # => ["ca", "at", "ts"]

    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.

    def caesar_cipher(num)
        alph = "abcdefghijklmnopqrstuvwxyz".chars
        self.chars.map{|c|alph.rotate(num)[alph.index(c)]}.join
    end
    
    # Examples:
    # p "apple".caesar_cipher(1)    #=> "bqqmf"
    # p "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # p "zebra".caesar_cipher(4)    #=> "difve"
end
