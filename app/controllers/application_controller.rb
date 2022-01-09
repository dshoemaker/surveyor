class ApplicationController < ActionController::Base
  def current_user
    @user = User.first || User.create(email: 'tester@example.com')
  end
end
