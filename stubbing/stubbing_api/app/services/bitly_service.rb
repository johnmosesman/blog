class BitlyService
  def self.shorten_url(url)
    return Bitly.shorten(url)
  end
end
