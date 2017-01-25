
require_relative  '../split.rb'
require_relative 'spec_helper.rb'

describe "test karatsuba functionality" do
  it 'multiplies two even sized numbers correctly' do
    expect(karatsuba(12345,12345)).to eq(152399025)
  end

  it 'multiplies two even sized numbers correctly' do
    expect(karatsuba(1234,4321)).to eq(5332114)
  end

  it 'multiplies two odd sized number correctly' do
    expect(karatsuba(123,345)).to eq(42435)
  end

  it 'multiplies two differently sized numbers together' do
    expect(karatsuba(16,3)).to eq(48)
  end

  it 'multiplies two differently sized numbers together' do
    expect(karatsuba(1698,3)).to eq(5094)
  end

  it 'multiplies two differently sized numbers together' do
    expect(karatsuba(15868382,345)).to eq(5474591790)
  end

  it 'multiplies two differently sized numbers together' do
    expect(karatsuba(2000,20)).to eq(40000)
  end

  it 'multiplies two very very large numbers together' do
    expect((karatsuba(3141592653589793238462643383279502884197169399375105820974944592,2718281828459045235360287471352662497757247093699959574966967627).to_s.length)).to eq(127)
  end


end
