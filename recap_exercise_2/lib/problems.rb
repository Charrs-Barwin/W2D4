# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(*nums)
    2.step{|n|return n if nums.all?{|num|n%num==0}}
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    pairs = str[0...-1].chars.map.with_index{|c,i|c + str[i+1]}
    pairs.max{|a,b| pairs.count(a) <=> pairs.count(b) }
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        h = {}
        self.each{|k,v|h[v]=k}
        h
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        pairs_sums = []
        self[0...-1].each_with_index{|n1,i1| self[i1+1..-1].each_with_index{|n2,i2| pairs_sums<< n1+n2 } }
        pairs_sums.count(num)
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        prc||= Proc.new {|a, b| a <=> b }
        (self.count-1).times do |i| 
            if prc.call(self[i],self[i+1]) == 1
                self[i],self[i+1] = self[i+1],self[i]
                self.bubble_sort(&prc)
            end
        end
        self
    end
    
end
