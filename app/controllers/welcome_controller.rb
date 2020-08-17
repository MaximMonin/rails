class WelcomeController < ApplicationController
  def index
  end
# Init Vue.js Vuex.Stote
  def initstore
    respond_to do |format|
      msg = { :lang => I18n.locale, :user => current_user, :baseurl => request.base_url, :servertime => DateTime.now.strftime("%Q") }
      format.json  { render :json => msg } 
    end
  end
end
