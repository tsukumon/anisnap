class RankingController < ApplicationController


  #週間
  def weekly

    @puts = '週間アニメ'

    #コレクト分岐
    if params[:ranking_select] == 'total'
    @ranking = Ranking.where.not(rank_total_weekly: nil).order(rank_total_weekly: "ASC").page(params[:page]).per(30)
    @puts_one = '総合スコア'

    elsif params[:ranking_select] == 'ave'
    @ranking = Ranking.where.not(rank_ave_weekly: nil).order(rank_ave_weekly: "ASC").page(params[:page]).per(30)
    @puts_one = '満足度'

    elsif params[:ranking_select] == 'mylist'
    @ranking = Ranking.where.not(rank_mylist_weekly: nil).order(rank_mylist_weekly: "ASC").page(params[:page]).per(30)
    @puts_one = 'マイリスト'

    elsif params[:ranking_select] == 'review'
    @ranking = Ranking.where.not(rank_review_weekly: nil).order(rank_review_weekly: "ASC").page(params[:page]).per(30)
    @puts_one = '評価・感想数'

    elsif params[:ranking_select] == 'story'
    @ranking = Ranking.where.not(rank_story_weekly: nil).order(rank_story_weekly: "ASC").page(params[:page]).per(30)
    @puts_one = '物語'

    elsif params[:ranking_select] == 'art'
    @ranking = Ranking.where.not(rank_write_weekly: nil).order(rank_write_weekly: "ASC").page(params[:page]).per(30)
    @puts_one = '作画'

    elsif params[:ranking_select] == 'music'
    @ranking = Ranking.where.not(rank_music_weekly: nil).order(rank_music_weekly: "ASC").page(params[:page]).per(30)
    @puts_one = '音楽'

    elsif params[:ranking_select] == 'voice'
    @ranking = Ranking.where.not(rank_voice_weekly: nil).order(rank_voice_weekly: "ASC").page(params[:page]).per(30)
    @puts_one = '声優'

    elsif params[:ranking_select] == 'chara'
    @ranking = Ranking.where.not(rank_chara_weekly: nil).order(rank_hara_weekly: "ASC").page(params[:page]).per(30)
    @puts_one = 'キャラ'
    end
    #コレクト分岐終了

    #サイド最新レビュー
    @review = Review.order(id: "DESC").limit(7)
    #サイド最新記事
    @new_tyoko=Alert.order(id: 'DESC').first(10)
    @review_fav = Review.order('good_count DESC').first(6)


    # これ以下はAjax通信の場合のみ通過
    return unless request.xhr?

    case params[:type]
    when 'weekly_pgn'
      render "ranking/#{params[:type]}"
    end


  end

  #全期間
  def total

    @puts = '全期間アニメ'

    #コレクト分岐
    if params[:ranking_select] == 'total'
    @ranking = Ranking.order(rank_total: "ASC").page(params[:page]).per(30)
    @puts_one = '総合スコア'

    elsif params[:ranking_select] == 'ave'
    @ranking = Ranking.order(rank_ave: "ASC").page(params[:page]).per(30)
    @puts_one = '満足度'

    elsif params[:ranking_select] == 'mylist'
    @ranking = Ranking.order(rank_mylist: "ASC").page(params[:page]).per(30)
    @puts_one = 'マイリスト'

    elsif params[:ranking_select] == 'review'
    @ranking = Ranking.order(rank_review: "ASC").page(params[:page]).per(30)
    @puts_one = '評価・感想数'

    elsif params[:ranking_select] == 'story'
    @ranking = Ranking.order(rank_story: "ASC").page(params[:page]).per(30)
    @puts_one = '物語'

    elsif params[:ranking_select] == 'art'
    @ranking = Ranking.order(rank_write: "ASC").page(params[:page]).per(30)
    @puts_one = '作画'

    elsif params[:ranking_select] == 'music'
    @ranking = Ranking.order(rank_music: "ASC").page(params[:page]).per(30)
    @puts_one = '音楽'

    elsif params[:ranking_select] == 'voice'
    @ranking = Ranking.order(rank_voice: "ASC").page(params[:page]).per(30)
    @puts_one = '声優'

    elsif params[:ranking_select] == 'chara'
    @ranking = Ranking.order(rank_chara: "ASC").page(params[:page]).per(30)
    @puts_one = 'キャラ'
    end
    #コレクト分岐終了

    #サイド最新レビュー
    @review = Review.order(id: "DESC").limit(7)
    #サイド最新記事
    @new_tyoko=Alert.order(id: 'DESC').first(10)
    @review_fav = Review.order('good_count DESC').first(6)


    # これ以下はAjax通信の場合のみ通過
    return unless request.xhr?

    case params[:type]
    when 'ranking_pgn'
      render "ranking/#{params[:type]}"
    end

  end

  def ranking

    #年・シーズン
    @year = params[:year]
    @season = params[:season]

    #シーズンの文字出力
    if @season == 'spring'
      @puts = @year + '年' + '春アニメ'
    elsif @season == 'summer'
      @puts = @year + '年' + '夏アニメ'
    elsif @season == 'autumn'
      @puts = @year + '年' + '秋アニメ'
    elsif @season == 'winter'
      @puts = @year + '年' + '冬アニメ'
    end

    #コレクト分岐
    if params[:ranking_select] == 'total'
    @ranking = Ranking.where(year: params[:year]).where(season: params[:season]).order(rank_total_season: "ASC").page(params[:page]).per(30)
    @puts_one = '総合スコア'

    elsif params[:ranking_select] == 'ave'
    @ranking = Ranking.where(year: params[:year]).where(season: params[:season]).order(rank_ave_season: "ASC").page(params[:page]).per(30)
    @puts_one = '満足度'

    elsif params[:ranking_select] == 'mylist'
    @ranking = Ranking.where(year: params[:year]).where(season: params[:season]).order(rank_mylist_season: "ASC").page(params[:page]).per(30)
    @puts_one = 'マイリスト'

    elsif params[:ranking_select] == 'review'
    @ranking = Ranking.where(year: params[:year]).where(season: params[:season]).order(rank_review_season: "ASC").page(params[:page]).per(30)
    @puts_one = '評価・感想数'

    elsif params[:ranking_select] == 'story'
    @ranking = Ranking.where(year: params[:year]).where(season: params[:season]).order(rank_story_season: "ASC").page(params[:page]).per(30)
    @puts_one = '物語'

    elsif params[:ranking_select] == 'art'
    @ranking = Ranking.where(year: params[:year]).where(season: params[:season]).order(rank_write_season: "ASC").page(params[:page]).per(30)
    @puts_one = '作画'

    elsif params[:ranking_select] == 'music'
    @ranking = Ranking.where(year: params[:year]).where(season: params[:season]).order(rank_music_season: "ASC").page(params[:page]).per(30)
    @puts_one = '音楽'

    elsif params[:ranking_select] == 'voice'
    @ranking = Ranking.where(year: params[:year]).where(season: params[:season]).order(rank_voice_season: "ASC").page(params[:page]).per(30)
    @puts_one = '声優'

    elsif params[:ranking_select] == 'chara'
    @ranking = Ranking.where(year: params[:year]).where(season: params[:season]).order(rank_chara_season: "ASC").page(params[:page]).per(30)
    @puts_one = 'キャラ'

    end
    #コレクト分岐終了
    #サイド最新レビュー
    @review = Review.order(id: "DESC").limit(5)
    #サイド最新記事
    @new_tyoko=Alert.order(id: 'DESC').first(10)
    @review_fav = Review.order('good_count DESC').first(6)


    # これ以下はAjax通信の場合のみ通過
    return unless request.xhr?

    case params[:type]
    when 'ranking_season_pgn'
      render "ranking/#{params[:type]}"
    end

  end


  def search
    #サイド最新レビュー
    @review = Review.order(id: "DESC").limit(5)
    #サイド最新記事
    @new_tyoko=Alert.order(id: 'DESC').first(10)
    @review_fav = Review.order('good_count DESC').first(6)

    # これ以下はAjax通信の場合のみ通過
    return unless request.xhr?

    case params[:type]
    when 'ranking_search'
      render "ranking/#{params[:type]}"
    end

  end


  def choice

    #サイド最新レビュー
    @review = Review.order(id: "DESC").limit(5)
    #サイド最新記事
    @new_tyoko=Alert.order(id: 'DESC').first(10)
    @review_fav = Review.order('good_count DESC').first(6)
  end


end
