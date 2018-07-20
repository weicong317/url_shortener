require "byebug"

class Url < ActiveRecord::Base
  validates :long_url, presence: true, format: {with: /\Ahttps?:\/\/(w{3}.)?\w+.(com|net|org)(.\w+)?\z/};
  validates :short_url, presence: true

  def self.retrieve_short_url(long_url)
    if /\Ahttps?:\/\/(w{3}.)?\w+.(com|net|org)(.\w+)?\z/.match(long_url)
      if self.find_by(long_url: long_url)
        self.find_by(long_url: long_url).short_url
      else
        self.find_by(long_url: long_url)
      end
    else
      /\Ahttps?:\/\/(w{3}.)?\w+.(com|net|org)(.\w+)?\z/.match(long_url)
    end
  end
end
