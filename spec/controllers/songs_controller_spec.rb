require 'rails_helper'

describe SongsController, type: :controller do

  # test CRUD 

  # Create a song
  context "create a song" do

    it "should create a song" do
      song = {title: 'Venom', genre: 'Rap',artist: 'Eminem', album: 'Kammikaze',description: '', release_date: '2018,09,21'}

      expect{post :create, song: song}.to change{Song.count}.by(1)
    end

    it "should flash a notice message" do
      song = {title: 'Venom', genre: 'Rap',artist: 'Eminem', album: 'Kammikaze',description: '', release_date: '2018,09,21'}
      post :create, song: song
    
      expect(flash[:notice]).to match(/.* was successfully created./)
    end

    it "should redirect to the songs page" do
      song = {title: 'Venom', genre: 'Rap',artist: 'Eminem', album: 'Kammikaze',description: '', release_date: '2018,09,21'}
      post :create, song: song
    
      response.should redirect_to(songs_path)
    end
  end

  # Delete a song 
  context "delete song" do 
    
    it "should delete a song" do 
      song_id = "1234";
      song = Song.create!
      allow(Song).to receive(:find).with(song_id).and_return(song)
     
      expect{delete :destroy, id: song_id}.to change(Song, :count).by(-1)
    end

    it "should flash a notice message" do
      song_id = "1234";
      song = Song.create!
      allow(Song).to receive(:find).with(song_id).and_return(song)
      
      delete :destroy, id: song_id
    
      expect(flash[:notice]).to match(/Song .* was successfully deleted./)
    end

    it "should redirect to the songs page" do
      song_id = "1234";
      song = Song.create!
      allow(Song).to receive(:find).with(song_id).and_return(song)
      
      delete :destroy, id: song_id
    
      response.should redirect_to(songs_path)
    end

  end
    
  # test additional feature 

  # same artist

  context 'When specified song has a artist' do
    it 'should search for songs with same artist' do
      song_id = "1234";
      song = double('random_song', artist: 'Eminem')
      allow(Song).to receive(:find).with(song_id).and_return(song)

      expect(song).to receive(:search_same_artist)
      get :same_artist, id: song_id
    end

    it 'should return similar songs view' do
      song_id = "1234";
      song = double('random_song', artist: 'Eminem')
      allow(Song).to receive(:find).with(song_id).and_return(song)
      allow(song).to receive(:search_same_artist)

      get :same_artist, id: song_id

      expect(response).to render_template(:same_artist)
    end
  end

  context 'When specified song does not have a artist' do
    it "should flash a warning message" do
      song_id = "1234";
      song = double('random_song', title: 'Venom', artist: '')
      allow(Song).to receive(:find).with(song_id).and_return(song)
      song.should_not_receive(:search_same_artist)

      # execute code
      get :same_artist, id: song_id

      expect(flash[:warning]).to match(/.* has no artist info/)
    end

    it "should redirect to the songs page" do
      song_id = "1234";
      song = Song.create!
      allow(Song).to receive(:find).with(song_id).and_return(song)
      song.should_not_receive(:search_same_artist)

      get :same_artist, id: song_id
    
      response.should redirect_to(songs_path)
    end
  end

  # This should return the minimal set of attributes required to create a valid
  # Song. As you add validations to Song, be sursong_model_spec.rbe to
  # adjust the attributes here as well.
  # let(:valid_attributes) {
  #   skip("Add a hash of attributes valid for your model")
  # }

  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }

  # # This should return the minimal set of values that should be in the session
  # # in order to pass any filters (e.g. authentication) defined in
  # # SongsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      song = Song.create! 
      get :index, {}, valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      song = Song.create! 
      get :show, {:id => song.to_param}, valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, {}, valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      song = Song.create! 
      get :edit, {:id => song.to_param}, valid_session
      expect(response).to be_success
    end
  end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested song" do
  #       song = Song.create! valid_attributes
  #       put :update, {:id => song.to_param, :song => new_attributes}, valid_session
  #       song.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "redirects to the song" do
  #       song = Song.create! valid_attributes
  #       put :update, {:id => song.to_param, :song => valid_attributes}, valid_session
  #       expect(response).to redirect_to(song)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "returns a success response (i.e. to display the 'edit' template)" do
  #       song = Song.create! valid_attributes
  #       put :update, {:id => song.to_param, :song => invalid_attributes}, valid_session
  #       expect(response).to be_success
  #     end
  #   end
  # end
  
end
