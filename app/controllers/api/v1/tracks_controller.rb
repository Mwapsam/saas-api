class Api::V1::TracksController < ApplicationController
    def index
        tracks = Track.all
        render json: tracks, status: 200
    end

    def create
        category = Category.find(params[:id])
        track = category.tracks.new(track_params)
        if track.save
            render json: track, status: 200
        else
            render json: {errors: "Track was not created!"}, status: :unprocessable_entity
        end
    end

    private

    def track_params
        params.require(:track).permit(:name, :artist, :year, :public, :category_id, :image)
    end
end