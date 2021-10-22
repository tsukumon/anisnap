class HomeController < ApplicationController
  def index

    #お知らせ
    @alert = Alert.order(id: 'DESC').first(3)

    #今週アニメランキング
    @favanime_now=Ranking.where.not(rank_total_weekly: nil).order(rank_total_weekly: "ASC").first(5)

    #人気のニュース
    @new_anime = AnimeList.order(id: "DESC").first(5)

    #今週のいいねレビュー
    @goodreview = Review.order('good_count DESC').first(6)

    #来期アニメランキング5
    @nextseason =Ranking.where(season: 'winter').where(year: '2020').order('rank_total_season ASC').limit(3)
    #今期アニメランキング3
    @nowseason =Ranking.where(season: 'autumn').where(year: '2019').order('rank_total_season ASC').limit(3)


    #サイド最新レビュー
    @review = Review.order(id: "DESC").limit(5)
    @review_fav = Review.order('good_count DESC').first(6)

    #サイド最新記事
    @new_tyoko=Alert.order(id: 'DESC').first(10)



  end


  #プライバシー
  def privacy
    #サイド最新レビュー
    @review = Review.order(id: "DESC").limit(5)
    @review_fav = Review.order('good_count DESC').first(6)

    #サイド最新記事
    @new_tyoko=Alert.order(id: 'DESC').first(10)
  end

  def terms
    #サイド最新レビュー
    @review = Review.order(id: "DESC").limit(5)
    @review_fav = Review.order('good_count DESC').first(6)

    #サイド最新記事
    @new_tyoko=Alert.order(id: 'DESC').first(10)
  end

end
