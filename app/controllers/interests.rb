class Interests
    def process(params, session)
        data = {}
        if params.key?(:intrs)
            intrs = params[:intrs].split(',')
            clean = []
            intrs.each do |value|
                value = value.strip
                if value.match(/\A[a-zA-Z0-9 ]+\Z/) && value.length > 3 && value.length < 15
                    clean.push(value)
                end
            end
            intrs = clean.join(',')
            user = User.find_by(name: session[:uid])
            if user.interests.length == 0
                user.interests = intrs
            else
                user.interests = user.interests + ',' + intrs
            end
            user.save(validate: false)
            data[:redirect] = '/profile/' + session[:uid]
        else
            data[:redirect] = '/profile/' + session[:uid]
        end
        return data
    end
end