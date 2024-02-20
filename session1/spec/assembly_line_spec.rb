# frozen_string_literal: true

require 'rspec'

require_relative '../lib/problem2'

RSpec.describe 'AssemblyLine' do
  before do
    @assembly_line = AssemblyLine.new
  end

  context 'when condition' do
    it 'velocity 0 produces no cars' do
      @assembly_line.speed = 0
      expect(@assembly_line.production_rate).to eq(0)
      expect(@assembly_line.items_per_minute).to eq(0)
    end

    it 'velocity_range_2' do
      @assembly_line.speed = 2
      expect(@assembly_line.production_rate).to eq(442)
      expect(@assembly_line.items_per_minute).to eq(7)
    end
    it 'velocity_range_6' do
      @assembly_line.speed = 6
      expect(@assembly_line.production_rate).to eq(1193.4)
      expect(@assembly_line.items_per_minute).to eq(19)
    end
    it 'velocity_range_9' do
      @assembly_line.speed = 9
      expect(@assembly_line.production_rate).to eq(1591.2)
      expect(@assembly_line.items_per_minute).to eq(26)
    end
    it 'velocity_range_4' do
      @assembly_line.speed = 10
      expect(@assembly_line.production_rate).to eq(1701.7)
      expect(@assembly_line.items_per_minute).to eq(28)
    end
  end
end
