# frozen_string_literal: true

module CheckToken
  def check_token
    token = request.headers['x-zabaldu-token']
    if token != '' && (session = Session.find_by(token: token))
      @user = session.user
    else
      render json: { error: true, msg: 'Missing token' }.to_json, status: 404
    end
  end
end
