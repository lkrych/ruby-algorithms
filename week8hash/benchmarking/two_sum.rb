require 'benchmark'
require 'bloomfilter-rb'
require_relative '../two_sum_bloom.rb'
require_relative '../two_sum_hash.rb'
require_relative '../two_sum_naive.rb'

data = Array.new(100000) { rand(-10000...10000) }

Benchmark.bm do |b|
	b.report("Naive two-sum implementation: ") do
	    naive_two_sum(150,data)
	end
	b.report("Hashtable two-sum implementation: ") do
	    hash_two_sum(150,data)
	end
	b.report("Bloom Filter two-sum implementation: ") do
	    bloom_two_sum(150,data)
	end
end
	    
	   
