class PagesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  PASSWORD = 'ALOHOMORA'
  def index
  end

  def rsvp_view
    password = cookies[:password_used]
    if password != PASSWORD
        redirect_to '/'
    else
        @rsvp = Rsvp.new
    end
  end

  def enter
    password = params[:password].upcase
    if password == PASSWORD
       cookies[:password_used] = password
       redirect_to '/rsvps/new'
    else
       redirect_to '/'
    end
  end

  def rsvp
  end

  def thank_you
  end

  def gallery
    @images = []
    @fulls = Dir.glob("app/assets/images/weddingPictures/*.jpg")
    @thumbnails = Dir.glob("app/assets/images/thumbnails/*.jpg")
    @fulls.each_index do |i|
      @images << [@fulls[i].split('/').last, @thumbnails[i].split('/').last]
    end
  end
end
