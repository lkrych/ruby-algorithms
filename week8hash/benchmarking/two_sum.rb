require 'benchmark'
require 'bloomfilter-rb'
require_relative '../two_sum_bloom.rb'
require_relative '../two_sum_hash.rb'
require_relative '../two_sum_naive.rb'

data = Array (1..10000)

Benchmark.bm do |b|
	b.report("Naive two-sum implementation: ") do
	    naive_two_sum(19999,data)
	end
	b.report("Hashtable two-sum implementation: ") do
	    hash_two_sum(19999,data)
	end
	b.report("Bloom Filter two-sum implementation: ") do
	    bloom_two_sum(19999,data)
	end
end
	    
	   
