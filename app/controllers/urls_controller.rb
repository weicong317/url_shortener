class UrlsController < ApplicationController
  def index
    @url = Url.all
  end

  def create
    url = Url.new(long_url: params[:url][:long_url], short_url: SecureRandom.base64[0..8])
    if url.save
      redirect_to urls_path
    else
      @errors = "Invalid url"
      @url = Url.new
      render new_url_path
    end
  end

  def new
    @url = Url.new
  end

  def show
    @url = Url.find(params[:id])
  end
end
