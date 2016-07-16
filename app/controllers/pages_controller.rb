class PagesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  PASSWORD = 'ALOHAMORA'
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
end
