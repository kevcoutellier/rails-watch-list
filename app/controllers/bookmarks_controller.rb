class BookmarksController < ApplicationController
  before_action :set_list, only:[:new]


  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.create(bookmark_params)

    if @bookmark.save
      redirect_to @bookmark, notice: "bookmark was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    # No need for app/views/bookmarks/destroy.html.erb
    redirect_to bookmarks_path, status: :see_other
  end

  private

  def set_bookmark
    @bookmark= Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])

  end
end
