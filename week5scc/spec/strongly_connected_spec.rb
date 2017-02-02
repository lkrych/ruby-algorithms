require_relative 'spec_helper.rb'
require_relative '../strongly_connected.rb'

graph1 = {"A" => ["D","C"], "B" => ["A"], "C" => ["B","H","I"], "D"=> ["E","G"], "E" => ["F"], "F" => ["G"], "G" => ["E"], "H" => ["J", "K"], "I" => ["H"], "J" => ["K"], "K" => ["I"]}
graph2 = {"1" => ["4"], "2" => ["8"], "3" => ["6"], "4" => ["7"], "5" => ["2"], "6" => ["9"], "7" => ["1"], "8" => ["6", "5"], "9" => ["7", "3"]}
graph3 = {"1" => ["2"], "2" => ["3", "4", "6"], "3" => ["1", "4"], "4" => ["5"], "5" => ["4"], "6" => ["5", "7"], "7" => ["6", "8"], "8" => ["5", "7"]}

describe "test scc functionality" do
  it 'performs scc correctly' do
    expect(scc(graph1)).to eq(4)
  end
  
  it 'performs scc correctly' do
    expect(scc(graph2)).to eq(3)
  end
  
  it 'performs scc correctly' do
    expect(scc(graph3)).to eq(3)
  end
  
end