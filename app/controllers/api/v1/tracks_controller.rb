class Api::V1::TracksController < ApplicationController
    def index
        tracks = Track.all
        render json: tracks, status: 200
    end
end