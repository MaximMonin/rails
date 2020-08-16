class WelcomeController < ApplicationController
  def index
  end
# Init Vue.js Vuex.Stote
  def initstore
    lang = I18n.locale

    render json: lang
  end
end
