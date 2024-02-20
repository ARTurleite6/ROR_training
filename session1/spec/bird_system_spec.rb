# frozen_string_literal: true

require 'rspec'

require_relative '../lib/problem1'

RSpec.describe 'BirdSystem' do
  before do
    @arr = [0, 2, 5, 3, 7, 8, 4]
    @bird_system = BirdSystem.new @arr
  end

  after do
    # Do nothing
  end

  context 'when condition' do
    it 'bird week day count' do
      expect(@bird_system.week_bird_visit_count).to eq(@arr.to_s)

    end
    it 'total week count' do
      expect(@bird_system.total_week_count).to eq(@arr.sum)
    end
    it 'yesterday day count' do
      expect(@bird_system.yesterday_bird_count).to eq 4
    end
    it 'days with 5 or more birds' do
      expect(@bird_system.five_days_or_more_bird_count).to eq 3
    end
    it 'is there days without birds' do
      expect(@bird_system.days_without_birds?).to be_truthy
    end
  end
end
