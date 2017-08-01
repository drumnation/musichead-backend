class Api::V1::SongsController < ApplicationController
    before_action :set_song, only: [:show, :update]

    def index
        @songs = Song.all
        render json: @songs
    end

    def show
        render json: @song
    end

    def create
        @song = Song.new(song_params)
        if @song.save
            render json: @song
        else
            puts "Songs Controller: Failed to Create"
        end
    end

    def update
        if @song.update(song_params)
            render json: @song
        else
            puts "Songs Controller: Failed to update Song"
        end
    end

    def delete
        @song = Song.find(params[:song_id])
        @song.destroy
    end
        
    private

    def set_song
        @song = Song.find(params[:id])
    end
    
    def song_params
        params.require(:song).permit(
            :id,
            :name,
            :popularity,
            :length,
            :track_number,
            :disc_number,
            :preview,
            :open,
            :related_songs,
            :audio_analysis,
            :spotify_song_id,
            :record_label_id,
            :artist_id,
            :album_id
        )
    end
end