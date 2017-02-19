#Given an integer x and a sorted array a of N distinct integers, design an algorithm to determine if there exists 
#two distinct indices i and j such that a[i] + a[j] == x
def hash_two_sum(value,data)
    hash = {}
    hash = add_to_hash(hash,data)
    keys = hash.keys
    data.each do |data_item|
        search_item = value - data_item
        if keys.include?(search_item)
            puts "found in the hash"
            break
        end
    end
end

def add_to_hash(hash,data)
    data.each do |value|
        if hash.keys.include?(value)
            next
        else
            hash[value] = true
        end
    end
    return hash
end