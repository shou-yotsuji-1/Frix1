class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      email: params[:email],
      name: params[:name],
      college: params[:college],
      age: params[:age],
      password: params[:password]
      )
      if @user.save
        redirect_to("/toppages/index")
        flash[:notice] = 'ユーザーの登録完了'
      else 
        render("/user/new")
        
      end
  end
  
  def login_form
    
  end
  
  def login
    @user = User.find_by(email: params[:email],password: params[:password])
    if @user
      session[user_id] = @user.id
      redirect_to("/toppages/index")
    else
      redirect_to("/login")
    end
  end
  
  def login
    # メールアドレスのみを用いて、ユーザーを取得するように書き換えてください
    @user = User.find_by(email: params[:email])
    # if文の条件を&&とauthenticateメソッドを用いて書き換えてください
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to("/toppages/index")
      flash[:notice] = 'ログイン完了'
    else
      
      redirect_to("/login")
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end
  
end
