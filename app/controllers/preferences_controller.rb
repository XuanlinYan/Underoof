class PreferencesController < ApplicationController
    before_action :authorize
    helper_method :sort_column, :sort_direction
    def index
        @preferences = Preference.all()

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
        @preferences = @preferences.order(sort_column + " " + sort_direction).paginate(:per_page=>30, :page=>params[:page])
    end

    private
    def sort_column
        (Preference.column_names-["pet", "user.name"]).include?(params[:sort]) ? params[:sort] : "min_price"
    end
      
    def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end