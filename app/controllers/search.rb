class Search
    def process(params, session)
        data = {}
        query = '"' + params[:q] + '"'
        conn = ActiveRecord::Base.connection
        query = conn.quote(query)
        result = conn.exec_query(
            "SELECT id, name, sex, city FROM users WHERE MATCH(interests) AGAINST(#{query} IN BOOLEAN MODE)"
        )
        data[:result] = result
        return data
    end
end