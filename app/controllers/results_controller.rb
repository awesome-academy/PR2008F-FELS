class ResultsController < ApplicationController
    before_action :authenticate_user!
    def index
        @lessons = current_user.lessons
        @results = @lessons
    end
end
