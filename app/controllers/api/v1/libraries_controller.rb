# frozen_string_literal: true

module Api
  module V1
    class LibrariesController < ApplicationController
      def index
        contents = current_user.available_contents.order_by_created
        render json: contents
      end

      def create
        library = Library.new(library_params)
        if library.save
          render json: library, status: 201
        else
          render json: library.errors, status: :unprocessable_entity
        end
      end

      private

      def library_params
        params.permit(:user_id, :content_id)
      end
    end
  end
end
