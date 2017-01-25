
require_relative '../inversion.rb'
require_relative 'spec_helper.rb'

describe "test inversion count functionality" do
  it 'counts the number of inversions correctly' do
    expect(inversions([1,2,3,4,5])).to eq([[1,2,3,4,5], 0])
  end

  it 'counts the number of inversions correctly' do
    expect(inversions([1,3,2,4,5])).to eq([[1,2,3,4,5], 1])
  end

  it 'counts the number of inversions correctly' do
    expect(inversions([1,4,3,2,5])).to eq([[1,2,3,4,5], 3])
  end

  it 'counts the number of inversions correctly' do
    expect(inversions([4,2,3,1,5])).to eq([[1,2,3,4,5], 5])
  end

  it 'counts the number of inversions correctly' do
    expect(inversions([5,4,3,2,1])).to eq([[1,2,3,4,5], 10])
  end

  it 'counts the number of inversions correctly' do
    expect(inversions([8,4,2,1])).to eq([[1,2,4,8], 6])
  end

  it 'counts the number of inversions correctly' do
    expect(inversions([6,5,4,3,2,1])).to eq([[1,2,3,4,5,6], 15])
  end

  it 'counts the number of inversions correctly' do
    expect(inversions([54044,14108,79294,29649,25260,60660,2995,53777,49689,9083])).to eq([[2995, 9083, 14108, 25260, 29649, 49689, 53777, 54044, 60660, 79294], 28])
  end

end
