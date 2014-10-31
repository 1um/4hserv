class API::User < Grape::API
  resource :users do
    desc "Регистрация пользователя"
    get :registrate do
      {id:'123'}
    end
  end
end