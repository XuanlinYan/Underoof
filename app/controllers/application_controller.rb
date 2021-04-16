class ApplicationController < ActionController::Base
    include SessionsHelper
    def cities
        render json: CS.cities(params[:state], :us).to_json
    end
end
