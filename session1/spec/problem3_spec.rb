# frozen_string_literal: true

require 'rspec'

require_relative '../lib/problem3'

RSpec.describe 'Problem3' do
  before do
    @problem_solver = Problem3.new [2,7,11,15], 9
  end

  context 'when condition' do
    it 'succeeds' do
      expect(@problem_solver.answer).to eq [0, 1]
    end
  end
end
