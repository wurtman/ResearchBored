class Profile::BookmarksController < ApplicationController
  layout 'profile'
  skip_verify_authorized


  def show
  #def index
  #  authorize! :customer
      @bookmarks = Bookmark.all
  end

  def new
      @bookmark = Bookmark.new
  end
  
  def edit
  end

  def destroy
    @bookmark.destroy
    redirect_to profile_bookmark_path, notice: "Bookmark was successfully destroyed."
  end

end
