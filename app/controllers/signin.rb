class Signin
    def process(params, session)
        data = {}
        if !session.key?(:uid)
            if params[:login] != nil
                user = User.where(
                    "email = ? AND password = ?", params[:login][:email], params[:login][:password]
                ).pluck(:name)
                if !user.empty?
                    session[:uid] = user[0].downcase
                    data[:redirect] = '/profile/' + user[0].downcase
                else
                    data[:error] = 'You are not registered'
                end
            end
        else
            data[:redirect] = '/'
        end
        return data
    end
end