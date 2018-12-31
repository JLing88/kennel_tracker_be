module RequestSpecHelper
  def json
    JSON.parse(response.body)
  end

  def login_user(user)
    post '/api/v1/login', params: { auth: { email: user.email, password: user.password }}
    return json['jwt']
  end
end