# frozen_string_literal: true

require 'rspec'

require_relative '../lib/problem4'

RSpec.describe 'Problem4' do
  context 'when condition' do
    it 'first_case' do
      problem_solver = Problem4.new [1,2,3,4]

      expect(problem_solver.answer).to eq([24, 12, 8, 6])
    end

    it 'second_case' do
      problem_solver = Problem4.new [-1, 1, 0, -3, 3]

      expect(problem_solver.answer).to eq([0, 0, 9, 0, 0])
    end
  end
end
