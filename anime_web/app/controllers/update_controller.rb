class UpdateController < ApplicationController

  #アクセス制限(admin権限)
  before_action :set_current_user_admin, {only: [:index, :new]}

  def index
    @post_cnt = AnimeList.last
  end

  def new

    #season_st処理
    @year = params[:year]
    @season = params[:season]

    if params[:season] == "spring"
      @season_put = "春"
    elsif params[:season] == "summer"
      @season_put = "夏"
    elsif params[:season] == "autumn"
      @season_put = "秋"
    elsif params[:season] == "winter"
      @season_put = "冬"
    end

    if @year != nil and @season != nil
      @season_st = @year.to_s + "年" + @season_put.to_s + "アニメ"
    end
    @anime = AnimeList.new(
      title: params[:title],
      season: params[:season],
      year: params[:year],
      season_st: @season_st,
      media: params[:media],
      company: params[:company],
      story: params[:story],
      cv: params[:cv],
      staff: params[:staff],
      pv1: params[:pv1],
      pv2: params[:pv2],
      image: params[:image]
    )
    @anime.save


    redirect_to("/mg/anime")

  end

  def search
  end

  def edit
    @post_cnt = AnimeList.last
    @anime = AnimeList.find_by(id: params[:id])
  end

  def low

    #season_st処理
    @year = params[:year]
    @season = params[:season]

    if params[:season] == "spring"
      @season_put = "春"
    elsif params[:season] == "summer"
      @season_put = "夏"
    elsif params[:season] == "autumn"
      @season_put = "秋"
    elsif params[:season] == "winter"
      @season_put = "冬"
    end

    if params[:season] != nil and params[:year] != nil
      @season_st = @year.to_s + "年" + @season_put.to_s + "アニメ"
    end
    @anime = AnimeList.find_by(id: params[:id])
    @anime.title = params[:title]
      @anime.season= params[:season]
      @anime.year= params[:year]
      @anime.season_st= @season_st
      @anime.media= params[:media]
      @anime.company= params[:company]
      @anime.story= params[:story]
      @anime.cv= params[:cv]
      @anime.staff= params[:staff]
      @anime.pv1= params[:pv1]
      @anime.pv2=params[:pv2]
      if params[:image] != nil
      @anime.image= params[:image]
      end
    @anime.save


    redirect_to("/mg/anime")

  end


end
