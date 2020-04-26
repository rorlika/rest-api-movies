# frozen_string_literal: true

require 'rails_helper'

describe Library do
  describe '#user_id' do
    it { is_expected.to belong_to(:user) }
  end

  describe '#validates' do
    let(:user) { create(:user) }
    let(:season) { create(:content, number: 1, type: 'Season') }
    let(:episode) { create(:content, number: 1, type: 'Episode', parent_id: season.id) }
    let!(:library) { create(:library, content: season, user: user) }

    it 'validate that content id should be a movie or a season' do
      subject.content_id = episode.id
      subject.valid?
      expect(subject.errors[:library]).to include('needs either a movie or a season')
    end

    it 'validate contents that are already purchased' do
      subject.content_id = season.id
      subject.user_id = user.id
      subject.valid?
      expect(subject.errors[:content_id]).to include('has already been taken')
    end
  end

  describe '#purchase the same content after purchase expires' do
    let(:user) { create(:user) }
    let(:season) { create(:content, number: 1, type: 'Season') }
    let!(:library) { create(:library, content: season, user: user, created_at: 3.days.ago) }

    it 'allow purchase again' do
      subject.content_id = season.id
      subject.user_id = user.id
      subject.valid?
      expect(subject).to be_valid
    end
  end
end
