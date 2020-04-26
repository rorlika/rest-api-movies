# frozen_string_literal: true

module Api
  module V1
    class ContentsController < ApplicationController
      def index
        contents = Content.where.not(type: 'Episode').order_by_created
        render json: contents
      end
    end
  end
end
