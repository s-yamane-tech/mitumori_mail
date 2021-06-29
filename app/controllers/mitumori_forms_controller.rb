class MitumoriFormsController < ApplicationController
    before_action :authenticate_user!
    def new
        @mitumori_form = MitumoriForm.new
    end
end
