class PreferencesController < ApplicationController
    before_action :authorize
    helper_method :sort_column, :sort_direction

    def new
        @preference = current_user.build_preference
    end

    def create
        state_id = State.where("two_digit_code = ?", params[:state]).ids[0]
        city_id = State.find(state_id).cities.where("name = ?", params[:city]).ids[0]
        @preference = current_user.build_preference(preference_params)
        @preference.state_id = state_id
        @preference.city_id = city_id
        if @preference.save
          flash[:success] = "Preference created!"
          redirect_to new_preference_path
        else
          render "new"
        end
    end
    
    def index
        @preferences = Preference.all()

        if !params[:state].blank?
            curr_state_id = State.where(two_digit_code: params[:state]).ids[0]
            @preferences = @preferences.where("state_id = ?", "#{curr_state_id}")
        end

        if !params[:city].blank?
            curr_city_id = City.where(name: params[:city]).ids[0]
            @preferences = @preferences.where("city_id = ?", "#{curr_city_id}")
        end

        if !params[:min_price].blank?
            @preferences = @preferences.where("min_price >= ?", "#{params[:min_price]}")
        end

        if !params[:max_price].blank?
            @preferences = @preferences.where("max_price <= ?", "#{params[:max_price]}")
        end
        
        if !params[:start_date].blank?
            @preferences = @preferences.where("start_date <= ?", "#{params[:start_date]}")
        end
        
        if !params[:end_date].blank?
            @preferences = @preferences.where("end_date >= ?", "#{params[:end_date]}")
        end
        
        if !params[:pet].blank?
            @preferences = @preferences.where("pet = ?", "#{params[:pet]}")
        end
        @count = @preferences.count
        @preferences = @preferences.order(sort_column + " " + sort_direction).paginate(:per_page=>10, :page=>params[:page])
    end

    def show
        @preference = Preference.find(params[:id])
    end

    private

    def preference_params
        params.require(:preference).permit(:location, :min_price, :max_price, :start_date, :end_date, :pet)
    end

    def sort_column
        (Preference.column_names-["pet", "user.name"]).include?(params[:sort]) ? params[:sort] : "min_price"
    end
      
    def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end