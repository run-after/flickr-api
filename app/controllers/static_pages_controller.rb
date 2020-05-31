class StaticPagesController < ApplicationController
  require 'flickraw'

  def home
    @user = params[:user_id]
    flickr = FlickRaw::Flickr.new
    @photos = flickr.people.getPublicPhotos(user_id: @user) unless @user.nil?

    unless @photos.nil?
      @photos.map do |pic| 
         @title = "#{pic.title}"
         @url = url_generate(pic)
       end 
    end 

  end
  private
    def url_generate(pic)
      "https://farm#{pic.farm}.staticflickr.com/#{pic.server}/#{pic.id}_#{pic.secret}.jpg"
    end
end
