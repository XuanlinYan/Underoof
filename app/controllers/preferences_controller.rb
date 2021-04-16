class PreferencesController < ApplicationController
    before_action :authorize
    helper_method :sort_column, :sort_direction
    before_action :correct_preference, only: [:new, :create, :edit, :update]

    def new
        @preference = Preference.new
    end

    def create
        @preference = Preference.new(preference_params)
        state_id = State.where("two_digit_code = ?", params[:state]).ids[0]
        city_id = State.find(state_id).cities.where("name = ?", params[:city]).ids[0]
        @preference.state_id = state_id
        @preference.city_id = city_id
        @preference.user_id = current_user.id
        
        if @preference.save
          flash[:success] = "Preference created!"
          redirect_to edit_preference_path(current_user.preference)
        else
          render action: :new
        end
    end
    
    def edit
        @preference = Preference.find(params[:id])
    end

    def update
        @preference = Preference.find(params[:id])

        state_id = State.where("two_digit_code = ?", params[:state]).ids[0]
        city_id = State.find(state_id).cities.where("name = ?", params[:city]).ids[0]
        
        @preference.state_id = state_id
        @preference.city_id = city_id
        if @preference.update(preference_params)
            flash[:success] = "Preference updated"
            redirect_to edit_preference_path(current_user.preference)
        else
            render action: :edit
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
    def correct_preference
        @preference = Preference.find(params[:id])
        redirect_to edit_user_path(current_user) unless @preference == current_user.preference
    end

    def preference_params
        params.require(:preference).permit(:user_id, :state_id, :city_id, :location, :min_price, :max_price, :start_date, :end_date, :pet)
    end

    def sort_column
        (Preference.column_names-["pet", "user.name"]).include?(params[:sort]) ? params[:sort] : "min_price"
    end
      
    def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end