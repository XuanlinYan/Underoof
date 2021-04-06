module PreferencesHelper
    def sortable(column, title = nil)
        title ||= column.titleize
        direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
        link_to title, search_params.merge(:sort=>column, :direction=> direction, :page=>nil)
    end

    private
    def search_params
        params.permit(:state_id, :county_id, :min_price, :max_price, :start_date, :end_date, :pet)
    end
end
