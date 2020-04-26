# frozen_string_literal: true

module Api
  module V1
    class SeasonsController < ApplicationController
      def index
        # seasons = Season.all.order(:created_at)
        # render json: seasons, include: :episodes
        seasons = Season.with_episodes
        render json: seasons
      end
    end
  end
end
