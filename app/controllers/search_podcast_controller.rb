class SearchPodcastController < ApplicationController
  def show
    redirect_to root
  end

  private

  def search_pocast
    query = "about+tomorrow"
    url = "https://itunes.apple.com/search?term=#{query}&country=US&media=podcast"
    req = HTTParty.get(url)
  end
end
