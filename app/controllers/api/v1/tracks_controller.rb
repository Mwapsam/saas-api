class Api::V1::TracksController < ApplicationController
    before_action :set_track, only: %i[update destroy]

    def index
        tracks = Track.all
        render json: tracks, status: 200
    end

    def create
        track = Track.new(track_params)
        if track.save
            render json: track, status: 200
        else
            render json: {errors: "Track was not created!"}, status: :unprocessable_entity
        end
    end

    def update
        if @track.update(track_params)
            render json: @track
        else
            render json: @track.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @track = Track.find(params[:id])
        if @track.destroy
            render json: { message: 'Track has been successfully deleted' }
        else
            render json: @track.errors, status: :unprocessable_entity
        end
    end

    private

    def set_track
        @track = Track.find(params[:id])
    end

    def track_params
        params.require(:track).permit(:name, :artist, :year, :public, :category_id, :image, :audio)
    end
end