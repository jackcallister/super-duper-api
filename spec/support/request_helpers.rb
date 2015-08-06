module Requests
  module JsonHelpers
    def json
      @json ||= JSON.parse(response.body)
    end
  end

  module SessionHelpers
    def sign_in_as_user
      @user ||= FactoryGirl.create(:user)
      @user.reset_authentication_token! unless @user.access_token

      @request.headers['Authorization'] = @user.access_token
    end
  end
end
