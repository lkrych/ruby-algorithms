require_relative  '../split.rb'
require_relative 'spec_helper.rb'

describe "test split functionality" do
  it 'splits an odd number correctly' do
    expect(split_in_two(12345,3)).to eq([123, 45])
  end

  it 'splits an even number correctly' do
    expect(split_in_two(1234,2)).to eq([12,34])
  end

  it 'splits a small even number correctly' do
    expect(split_in_two(16,3)).to eq([0,16])
  end

  it 'splits a small even number correctly' do
    expect(split_in_two(16,1)).to eq([1,6])
  end


end
