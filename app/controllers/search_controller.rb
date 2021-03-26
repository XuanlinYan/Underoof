class SearchController < ApplicationController
    before_action :authorize

    def main
        @USA_STATES = ["Alabama", "Alaska","Arizona", "Arkansas", "California","Colorado","Connecticut","Delaware","Florida",
            "Georgia","Hawaii","Idaho","Illinois","Indiana", "Iowa","Kansas","Kentucky","Louisiana","Maine", "Maryland",
            "Massachusetts","Michigan","Minnesota","Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", 
            "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", 
            "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", 
            "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"
            ]
        
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
        
    end

    def sort
        # @preferences = @preferences.order(params[:sort])
    end
end
