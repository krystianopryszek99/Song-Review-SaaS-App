class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  # GET /songs
  def index
    #byebug
    @all_genres = Song.all_genres
    @genres_to_show = genres
    @genres_hash = genres_hash
    @sort_by = sort_by
    @songs = Song.with_genres(genres, sort_by)
    session[:genres] = @genres_to_show
    session[:sort_by] = @sort_by
  end

  def sort_by
    params[:sort_by] || session[:sort_by]
  end

  def genres_hash
    params[:genres] 
  end

  def genres
    params[:genres]&.keys || session[:genres] || Song.all_genres
  end

  # GET /songs/1
  def show
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  def same_artist
    song_id = params[:id]
    song = Song.find(song_id)
    if song.artist.present?
      @artist = song.artist
      @songs = song.search_same_artist
    else
      flash[:warning] = "'#{song.title}' has no artist info"
      redirect_to songs_path
    end
  end

  # POST /songs
  def create
    @song = Song.create!(song_params)
    flash[:notice] = "#{@song.title} was successfully created."
    redirect_to songs_path
  end

  # PATCH/PUT /songs/1
  def update
    @song = Song.find params[:id]
    @song.update_attributes!(song_params)
    flash[:notice] = "#{@song.title} was successfully updated."
    redirect_to song_path(@song)
  end

  # DELETE /songs/1
  def destroy
    song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song '#{@song.title}' was successfully deleted."
    redirect_to songs_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def song_params
      params.require(:song).permit(:title, :genre, :artist, :album, :description, :release_date)
    end
end
