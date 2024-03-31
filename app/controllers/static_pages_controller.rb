require 'flickr'

class StaticPagesController < ApplicationController

  def home
    if params[:flickr_id] != ""
      flickr = Flickr.new

      begin
        @photos = flickr.photos.search user_id: params[:flickr_id]
        @photo_urls = @photos.map { |photo| "https://live.staticflickr.com/#{photo['server']}/#{photo['id']}_#{photo['secret']}.jpg" }
      rescue Flickr::FailedResponse => e
        flash[:alert] = "Error: #{e.message}"
      end
    end
  end
end
