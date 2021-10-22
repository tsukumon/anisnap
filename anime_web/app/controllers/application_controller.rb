class ApplicationController < ActionController::Base


  #全てに共通するものの定義
  before_action :set_current_user,:set_search,:set_term


  def set_term
    @new_term = Season.first
  end
  
def set_search
  #@search = Article.search(params[:q])
  @search = AnimeList.ransack(params[:q]) #ransackメソッド推奨
  @search_articles = @search.result.page(params[:page])

  @search_name = @search.title_or_cv_cont
  @search_count = 1

end


def set_current_user
  current_user = User.find_by(id: session[:user_id])
end



# ログインしてない人に対してのアクセス制限
def authenticate_user
  if current_user == nil
    flash[:notice] = "ログインが必要です"
    redirect_to("/users/sign_in")
  end
end

#すでにログインしてる人に対してのアクセス制限
def forbid_login_user
  if current_user
    flash[:notice] = "すでにログインしています"
    redirect_to("/")
  end
end

#ログイン後のリダイレクト
def after_sign_in_path_for(resource)
  "/user/#{current_user.userid}"
end


#admin権限
def set_current_user_admin
  if current_user != nil
    if current_user.id != 1
    redirect_to("/")
    end
  else
  redirect_to("/")
  end
end

before_action :configure_permitted_parameters, if: :devise_controller?

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :userid, :image, :email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :userid, :image, :email])
  end


end
