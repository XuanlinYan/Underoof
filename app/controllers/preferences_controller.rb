class PreferencesController < ApplicationController
    def index
        @preferences = Preference.all
    end
end
