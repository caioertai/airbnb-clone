class FlatsController < ApplicationController
  # Sets a URL constant to be used by the whole controller (both class and instances)
  URL = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json"

  # Sets a callback, with the name of set_flats (defined on the private interface)
  # everytime an action on this controller is called
  before_action :set_flats

  # Despite being empty, index has @flats, thanks to our callback
  def index
  end

  # Show also has access to @flats thanks to the set_flats callback
  def show
    @flat = @flats.find { |flat| flat["id"] == params[:id].to_i }
  end

  private

  # This sets @flats to be the result of the GET of our API
  def set_flats
    @flats = JSON.parse(open(URL).read)
  end
end
