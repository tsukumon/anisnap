class UserController < ApplicationController

  #アクセス制限(まだログインしてない)
  before_action :authenticate_user, {only: [:profile, :update,:review]}

  #他の人の情報をみれないように
  before_action :ensure_correct_user, {only: [:profile,:update, :review]}


  #ホーム
  def index
    @user = User.friendly.find(params[:id])

    #カウント処理
    @watch_now_count = Mitalist.where(user_id: @user.id, state: 2).count
    @watched_count = Mitalist.where(user_id: @user.id, state: 1).count
    @will_watch_count = Mitalist.where(user_id: @user.id, state: 3).count
    @stop_count = Mitalist.where(user_id: @user.id, state: 4).count
    @drop_count = Mitalist.where(user_id: @user.id, state: 5).count

    #ステータス
    @reviewcount = Review.where(user_id: @user.id).count
    @all_mylist = Mitalist.where(user_id: @user.id).count
    @good_get = Postlike.where(user_id: @user.id).count

    #ジョブ
    @job = Joblist.find_by(userid: @user.id)


    @userlog = UserlogMylist.where(user_id: @user.id).order(id: "DESC").page(params[:page]).per(10)

    # これ以下はAjax通信の場合のみ通過
    return unless request.xhr?

    case params[:type]
    when 'userlog'
      render "user/#{params[:type]}"
    end

  end

  #投稿
  def post
    @user = User.friendly.find(params[:id])

    @userpostlog = UserlogMylist.where(user_id: @user.id).where.not(review_id: nil).order(id: "DESC").page(params[:page]).per(10)

    #カウント処理
    @watch_now_count = Mitalist.where(user_id: @user.id, state: 2).count
    @watched_count = Mitalist.where(user_id: @user.id, state: 1).count
    @will_watch_count = Mitalist.where(user_id: @user.id, state: 3).count
    @stop_count = Mitalist.where(user_id: @user.id, state: 4).count
    @drop_count = Mitalist.where(user_id: @user.id, state: 5).count
    #ステータス
    @reviewcount = Review.where(user_id: @user.id).count
    @all_mylist = Mitalist.where(user_id: @user.id).count
    @good_get = Postlike.where(user_id: @user.id).count

    #ジョブ
    @job = Joblist.find_by(userid: @user.id)

    @select_now = Mitalist.where(user_id: @user.id, state: 2).page(params[:page]).order(created_at: :desc).per(18)
    @select_will = Mitalist.where(user_id: @user.id, state: 3).page(params[:page]).order(created_at: :desc).per(18)
    @select_done = Mitalist.where(user_id: @user.id, state: 1).page(params[:page]).order(created_at: :desc).per(18)
    @select_keep = Mitalist.where(user_id: @user.id, state: 4).page(params[:page]).order(created_at: :desc).per(18)
    @select_stop = Mitalist.where(user_id: @user.id, state: 5).page(params[:page]).order(created_at: :desc).per(18)

    # これ以下はAjax通信の場合のみ通過
    return unless request.xhr?

    case params[:type]
    when 'select_now','select_will' , 'select_done' , 'select_keep' , 'select_stop','userpostlog'
      render "user/#{params[:type]}"
    end
  end

  #投稿フォーム
  def review
    @user = User.friendly.find(params[:id])

    @anime = AnimeList.find_by(id: params[:review_anime_id])
    @episode = Episodelist.where(anime_id: @anime.id)

    #入力間隔判断(1日に30件投稿可能)
    if Review.where(user_id: @user.id, created_at: Date.today).count <= 30

    #入力処理↓
    @kansou =Review.new(kansou: params[:kansou], animetitle: @anime.title, anime_id: @anime.id, user_id: @user.id, state: params[:state],
    draw: params[:draw], music: params[:music], voice: params[:voice], chara: params[:chara], story: params[:story])

    if @kansou != nil
    @kansou.total = ((@kansou.story.to_f + @kansou.draw.to_f +  @kansou.music.to_f +  @kansou.voice.to_f +  @kansou.chara.to_f )/5)
    end
    @kansou.save

    if @kansou.save
        @newlog = UserlogMylist.new(user_id: @kansou.user_id, review_id: @kansou.id)
        @newlog.save
        redirect_to("/user/#{@user.userid}/post")
    end
    #入力処理↑
    end
    #入力間隔判断


    #カウント処理
    @watch_now_count = Mitalist.where(user_id: @user.id, state: 2).count
    @watched_count = Mitalist.where(user_id: @user.id, state: 1).count
    @will_watch_count = Mitalist.where(user_id: @user.id, state: 3).count
    @stop_count = Mitalist.where(user_id: @user.id, state: 4).count
    @drop_count = Mitalist.where(user_id: @user.id, state: 5).count
    #ステータス
    @reviewcount = Review.where(user_id: @user.id).count
    @all_mylist = Mitalist.where(user_id: @user.id).count
    @good_get = Postlike.where(user_id: @user.id).count
    #ジョブ
    @job = Joblist.find_by(userid: @user.id)

    @select_now = Mitalist.where(user_id: @user.id, state: 2).order(created_at: :desc).page(params[:page]).per(18)
    @select_will = Mitalist.where(user_id: @user.id, state: 3).order(created_at: :desc).page(params[:page]).per(18)
    @select_done = Mitalist.where(user_id: @user.id, state: 1).order(created_at: :desc).page(params[:page]).per(18)
    @select_keep = Mitalist.where(user_id: @user.id, state: 4).order(created_at: :desc).page(params[:page]).per(18)
    @select_stop = Mitalist.where(user_id: @user.id, state: 5).order(created_at: :desc).page(params[:page]).per(18)

    # これ以下はAjax通信の場合のみ通過
    return unless request.xhr?

    case params[:type]
    when 'select_now','select_will' , 'select_done' , 'select_keep' , 'select_stop'
      render "user/#{params[:type]}"
    end

  end


  #視聴リスト(みてる)
  def watch
    @user = User.friendly.find(params[:id])
    @watch =Mitalist.where(user_id: @user.id, state: 2).order(created_at: :desc)

    #カウント処理
    @watch_now_count = Mitalist.where(user_id: @user.id, state: 2).count
    @watched_count = Mitalist.where(user_id: @user.id, state: 1).count
    @will_watch_count = Mitalist.where(user_id: @user.id, state: 3).count
    @stop_count = Mitalist.where(user_id: @user.id, state: 4).count
    @drop_count = Mitalist.where(user_id: @user.id, state: 5).count
    #ステータス
    @reviewcount = Review.where(user_id: @user.id).count
    @all_mylist = Mitalist.where(user_id: @user.id).count
    @good_get = Postlike.where(user_id: @user.id).count
    #ジョブ
    @job = Joblist.find_by(userid: @user.id)

  end


  #視聴リスト(watched)
  def watched
    @user = User.friendly.find(params[:id])
    @watch =Mitalist.where(user_id: @user.id, state: 1).order(created_at: :desc)

    #カウント処理
    @watch_now_count = Mitalist.where(user_id: @user.id, state: 2).count
    @watched_count = Mitalist.where(user_id: @user.id, state: 1).count
    @will_watch_count = Mitalist.where(user_id: @user.id, state: 3).count
    @stop_count = Mitalist.where(user_id: @user.id, state: 4).count
    @drop_count = Mitalist.where(user_id: @user.id, state: 5).count
    #ステータス
    @reviewcount = Review.where(user_id: @user.id).count
    @all_mylist = Mitalist.where(user_id: @user.id).count
    @good_get = Postlike.where(user_id: @user.id).count
    #ジョブ
    @job = Joblist.find_by(userid: @user.id)

  end

  #みたい
  def wanna_watch
    @user = User.friendly.find(params[:id])
    @watch =Mitalist.where(user_id: @user.id, state: 3).order(created_at: :desc)

    #カウント処理
    @watch_now_count = Mitalist.where(user_id: @user.id, state: 2).count
    @watched_count = Mitalist.where(user_id: @user.id, state: 1).count
    @will_watch_count = Mitalist.where(user_id: @user.id, state: 3).count
    @stop_count = Mitalist.where(user_id: @user.id, state: 4).count
    @drop_count = Mitalist.where(user_id: @user.id, state: 5).count
    #ステータス
    @reviewcount = Review.where(user_id: @user.id).count
    @all_mylist = Mitalist.where(user_id: @user.id).count
    @good_get = Postlike.where(user_id: @user.id).count
    #ジョブ
    @job = Joblist.find_by(userid: @user.id)
  end

  #一時中断
  def watch_hold
    @user = User.friendly.find(params[:id])
    @watch =Mitalist.where(user_id: @user.id, state: 4).order(created_at: :desc)

    #カウント処理
    @watch_now_count = Mitalist.where(user_id: @user.id, state: 2).count
    @watched_count = Mitalist.where(user_id: @user.id, state: 1).count
    @will_watch_count = Mitalist.where(user_id: @user.id, state: 3).count
    @stop_count = Mitalist.where(user_id: @user.id, state: 4).count
    @drop_count = Mitalist.where(user_id: @user.id, state: 5).count
    #ステータス
    @reviewcount = Review.where(user_id: @user.id).count
    @all_mylist = Mitalist.where(user_id: @user.id).count
    @good_get = Postlike.where(user_id: @user.id).count
    #ジョブ
    @job = Joblist.find_by(userid: @user.id)

  end


  #視聴中止
  def watch_drop
    @user = User.friendly.find(params[:id])
    @watch =Mitalist.where(user_id: @user.id, state: 5).order(created_at: :desc)

    #カウント処理
    @watch_now_count = Mitalist.where(user_id: @user.id, state: 2).count
    @watched_count = Mitalist.where(user_id: @user.id, state: 1).count
    @will_watch_count = Mitalist.where(user_id: @user.id, state: 3).count
    @stop_count = Mitalist.where(user_id: @user.id, state: 4).count
    @drop_count = Mitalist.where(user_id: @user.id, state: 5).count
    #ステータス
    @reviewcount = Review.where(user_id: @user.id).count
    @all_mylist = Mitalist.where(user_id: @user.id).count
    @good_get = Postlike.where(user_id: @user.id).count
    #ジョブ
    @job = Joblist.find_by(userid: @user.id)

  end


#他のアカウントを編集出来ないように
def ensure_correct_user
  if current_user.userid != params[:id]
    flash[:notice] = "権限がありません"
    redirect_to("/")
  end
end


end
