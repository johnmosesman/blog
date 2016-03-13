require 'test_helper'

class BitlyServiceTest < ActiveSupport::TestCase
  def test_shorten_url
    Bitly.stubs(:shorten).returns("bit.ly/something")
    assert_match /bit.ly/, BitlyService.shorten_url("some_url")
  end
end
