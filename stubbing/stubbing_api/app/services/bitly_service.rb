class BitlyService
  def self.shorten_url(url)
    # Don't want this calling out to Bitly every time we run the tests.
    return Bitly.shorten(url)
  end
end
