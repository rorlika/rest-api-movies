# frozen_string_literal: true

module Api
  module V1
    class MoviesController < ApplicationController
      def index
        movies = Movie.all.order_by_created
        render json: movies
      end
    end
  end
end
