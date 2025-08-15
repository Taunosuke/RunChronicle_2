class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :create ]

  def create
    auth = request.env[ 'omniauth.auth' ]
    user = find_or_create_from_auth_hash(auth)

    if user
      sign_in(user, bypass: true)
      redirect_to root_path, notice: "ログインしました"
    else
      redirect_to new_user_registration_path, alert: "ログインに失敗しました"
    end
  end

  def destroy
    sign_out(current_user)
    redirect_to root_path, notice: "ログアウトしました"
  end

  private

  def find_or_create_from_auth_hash(auth)
    email = auth.info.email
    name = auth.info.name

    User.find_or_create_by(email: email) do |user|
      user.name = name
      user.password = SecureRandom.hex(10)
      user.skip_confirmation! if user.respond_to?(:skip_confirmation!)
    end
  end
end
