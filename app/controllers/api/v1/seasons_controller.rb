# frozen_string_literal: true

module Api
  module V1
    class SeasonsController < ApplicationController
      def index
        seasons = Season.all.order_by_created
        render json: seasons, include: :episodes
      end
    end
  end
end
