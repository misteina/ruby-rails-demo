class Signup
    def process(params, session)
        data = {}
        if !session.key?(:uid)
            if params[:register] != nil
                data[:model] = User.new(reg_params(params))
                if data[:model].save
                    session[:uid] = params[:register][:name].downcase
                    data[:redirect] = '/profile/' + params[:register][:name].downcase
                end
            end
        else
            data[:redirect] = '/'
        end
        return data
    end
end

private
  def reg_params(params)
    params[:register][:interests] = ""
    params.require(:register).permit(:name, :sex, :city, :email, :interests, :password, :password_confirmation)
  end