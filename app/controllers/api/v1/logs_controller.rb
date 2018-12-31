class Api::V1::LogsController < ApplicationController
  def index
    options = { is_collection: true }
    render json: ActivitySerializer.new(PublicActivity::Activity.all, options)
                    .serialized_json, status: 200
  end
end
