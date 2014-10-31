class API::Words < Grape::API
  resource :words do

  	desc "Проверить наличие фонем в базе пользователя"
  	params do
        requires :id, type: Integer, desc: "Идентификатор пользователя. Брать в UserRegistrate"
        requires :words, type: String, desc: "слово1,слово2,слово3"
    end
    get :check do
      get = params[:words].split(',')
      result = {words:[]}
      get.sample(get.length/2).each do |w|
      	result[:words]<<{ruword:w,engword:w,rate:0.5}
      end
      result
    end

    desc "Добавлять слово в базу"
  	params do
        requires :id, type: Integer, desc: "Идентификатор пользователя. Брать в UserRegistrate"
        requires :word, type: String, desc: "слово1"
    end
    post :add do
      {word:params[:word],some_other_params:'=)'}
    end

    desc "Пользователь отметил слово, что запомнил"
    params do
        requires :id, type: Integer, desc: "Идентификатор пользователя. Брать в UserRegistrate"
        requires :word, type: String, desc: "слово1"
    end
    put :mark_as_known do
      {word:params[:word],some_other_params:'=)'}
    end

    desc "Пользователь посмотрел подсказку"
    params do
        requires :id, type: Integer, desc: "Идентификатор пользователя. Брать в UserRegistrate"
        requires :word, type: String, desc: "слово1"
    end
    put :mark_as_forgotten do
      {word:params[:word],some_other_params:'=)'}
    end

  end
end
  