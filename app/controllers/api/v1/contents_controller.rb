# frozen_string_literal: true

module Api
  module V1
    class ContentsController < ApplicationController
      def index
        contents = Content.where.not(type: 'Episode').order(:created_at)
        render json: contents
      end
    end
  end
end
