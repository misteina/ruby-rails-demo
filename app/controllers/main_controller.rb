class MainController < ApplicationController
    def entry
        path = params[:path]
        if path != nil
          action = path.split('/')[0].capitalize
        else
          action = 'Home'
        end
        inst = action.constantize.new
        @data = inst.process(params, session)
        if @data.key?(:redirect)
            redirect_to @data[:redirect]
        else
            render action.downcase
        end
    end
end
