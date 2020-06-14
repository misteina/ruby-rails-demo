class Logout
    def process(params, session)
        session.delete(:uid)
        data = {"redirect": "/"}
        return data
    end
end