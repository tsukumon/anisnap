class SettingController < ApplicationController

  #アクセス制限(まだログインしてない)
  before_action :authenticate_user, {only: [:profile, :update]}

  def result
  end

  def profile
    @user=User.find_by(id: current_user)
  end




  def update
    @user=User.find_by(id: current_user)
    @user.username = params[:username]
    @user.userid = params[:userid]
    @user.image = params[:image]
    @user.bgimage = params[:bgimage]
    @user.intro = params[:intro]


    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/user/#{params[:userid]}")
    else
      render("/setting/profile")
    end

  end

  #他のアカウントを編集出来ないように
  def ensure_correct_user
    if current_user.id != @user.userid
      flash[:notice] = "権限がありません"
      redirect_to("/")
    end
  end


end
