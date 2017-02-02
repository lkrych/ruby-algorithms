require_relative 'spec_helper.rb'
require_relative '../topological_sort.rb'

graph1 = {"A" => ["B","C"], "B" => ["D"], "C" => ["D"], "D"=> []}
graph2 = {"A" => ["B","C"], "B" => ["D"], "C" => ["D"], "D"=> ["E"], "E" => []}
graph3 = {"A" => ["B","C"], "B" => ["D", "E"], "C" => ["E","F"], "D"=> [], "E" => [], "F" => []}

graph1_ans = [["D", "B", "C", "A"] , ["D", "C", "B", "A"]]
graph2_ans = [["E", "D", "B", "C", "A"] , ["E", "D", "C", "B", "A"]]
graph3_ans = [["D", "E", "B", "F", "C", "A"] , ["F", "E", "C", "D", "B", "A"] , ["E", "F", "C", "D", "B", "A"] , ["E", "D", "B", "F", "C", "A"]]

describe "test topological_sort functionality" do
  it 'performs topological_sort correctly' do
    expect(graph1_ans).to include(topological_sort(graph1))
  end

  it 'performs topological_sort correctly' do
    expect(graph2_ans).to include(topological_sort(graph2))
  end

  it 'performs topological_sort correctly' do
    expect(graph3_ans).to include(topological_sort(graph3))
  end
 end