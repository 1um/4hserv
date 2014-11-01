class API::Words < Grape::API
  resource :words do

    rescue_from ActiveRecord::RecordNotFound do |e|
      error_response(message: e.message, status: 404)
    end 
            

    before do
      @user = User.find(params[:id])
    end

    desc "Обновить предсказания пользователя"
    params do
        requires :id, type: Integer, desc: "Идентификатор пользователя. Брать в UserRegistrate"
    end
    get :predict do
      rez = @user.words.map{|w| {id:w.id, predict: rand(200)}}
    end

    desc "Добавить слово в базу"
    params do
        requires :id, type: Integer, desc: "Идентификатор пользователя. Брать в UserRegistrate"
        requires :ruword, type: String, desc: "слово1"
        requires :engword, type: String, desc: "word1"
    end
    post :add do
      w = Word.create(ruword:params[:ruword],engword:params[:engword],user:@user,learned:false,viewed:1)
    end

    desc "Пользователь отметил что запомнил|забыл слово"
    params do
      requires :id, type: Integer, desc: "Идентификатор пользователя. Брать в UserRegistrate"
      requires :word_id, type: Integer, desc: "Идентификатор слова. Брать в user_words" 
      requires :state, type: String, default: true, desc: "true, false (запомнил, забыл соответсвенно)" 
    end
    put :mark_as_known do
      w = Word.where(user:@user, id: params[:word_id]).first
      return {error:'Нет такого слова у такого пользователя'} unless w
      w.update_attributes(learned: params[:state])
      w
    end

    desc "Пользователь посмотрел подсказку"
    params do
      requires :id, type: Integer, desc: "Идентификатор пользователя. Брать в UserRegistrate"
      requires :word_id, type: Integer, desc: "Идентификатор слова. Брать в user_words" 
    end
    put :watch_help do
      w = Word.where(user:@user, id: params[:word_id]).first
      return {error:'Нет такого слова у такого пользователя'} unless w
      w.viewed+=1
      w.save
      w
    end

    desc "Все слова пользователя"
    params do
        requires :id, type: Integer, desc: "Идентификатор пользователя. Брать в UserRegistrate"
    end
    get :user_words do
      @user.words
    end

  end
end
  