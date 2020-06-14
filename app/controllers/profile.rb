class Profile
    def process(params, session)
        data = {}
        name = params[:path].split('/')[1]
        if defined?name
            user = User.where(name: name)
            if user != nil
                data[:user] = user
            else
                data[:redirect] = '/404'
            end
        end
        return data
    end
end