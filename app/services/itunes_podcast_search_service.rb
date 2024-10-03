class ItunesPodcastSearchService
  include HTTParty
  base_uri "https://itunes.apple.com"

  def initialize
    @options = { country: "US", media: "podcast" }
  end

  def search_podcast(query)
    response = self.class.get("/search", query: @options.merge(term: query))
    JSON.parse(response.body)
  end
end
