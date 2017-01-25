require_relative 'spec_helper.rb'
require_relative '../lin_select.rb'


describe "test lin_select functionality" do
  it 'counts the number of lin_select correctly' do
    expect(lin_select([1,2,3,4,5], 1)).to eq(1)
  end

  it 'counts the number of lin_select correctly' do
    expect(lin_select([1,3,2,4,5], 3)).to eq(3)
  end

  it 'counts the number of lin_select correctly' do
    expect(lin_select([1,4,3,2,5], 4)).to eq(4)
  end

  it 'counts the number of lin_select correctly' do
    expect(lin_select([4,2,3,1,5], 5)).to eq(5)
  end

  it 'counts the number of lin_select correctly' do
    expect(lin_select([5,4,3,2,1],2)).to eq(2)
  end

  it 'counts the number of lin_select correctly' do
    expect(lin_select([8,4,2,1], 3)).to eq(4)
  end

  it 'counts the number of lin_select correctly' do
    expect(lin_select([6,5,4,3,2,1],6)).to eq(6)
  end

  it 'counts the number of lin_select correctly' do
    expect(lin_select([54044,14108,79294,29649,25260,60660,2995,53777,49689,9083], 2)).to eq(9083)
  end

  it 'counts the number of lin_select correctly' do
    expect(lin_select([54044,14108,79294,29649,25260,60660,2995,53777,49689,9083], 5)).to eq(29649)
  end

end
