class API::Users < Grape::API
  resource :users do
    desc "Регистрация пользователя"
    get :registrate do
      user = User.create()
    end
  end
end