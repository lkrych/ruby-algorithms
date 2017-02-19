#Given an integer x and a sorted array a of N distinct integers, design an algorithm to determine if there exists 
#two distinct indices i and j such that a[i] + a[j] == x
require 'bloomfilter-rb'

def bloom_two_sum(value,data)
    bloom =  BloomFilter::Native.new(:size => 10000, :hashes => 2, :seed => 1, :bucket => 3, :raise => false)
    bloom = load_bloom(bloom, data)
    
    data.each do |data_item|
        search_item = value - data_item
        if bloom.include?(search_item)
            puts "found in the bloom!"
            break
        end
        
    end
end

def load_bloom(bloom, data)
    data.each do |data_item|
        bloom.insert(data_item)
    end
    return bloom
end