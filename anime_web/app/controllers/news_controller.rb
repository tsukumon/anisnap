class NewsController < ApplicationController

  impressionist unique: [:session_hash]

  #総合
  def all
    #ニュース
    @news=Alert.order(created_at: :desc).page(params[:page]).per(50)

    #人気のニュース
    @favnews = Newslist.order('impressions_count DESC').first(4)


    #サイド最新レビュー
    @review = Review.order(id: "DESC").limit(5)
    #サイド最新記事
    @new_tyoko=Alert.order(id: 'DESC').first(10)
    @review_fav = Review.order('good_count DESC').first(6)


    # これ以下はAjax通信の場合のみ通過
    return unless request.xhr?

    case params[:type]
    when 'new'
      render "news/#{params[:type]}"
    end


  end


  #記事内容ページ
  def article


    @news=Newslist.find_by(id: params[:id])

    impressionist(@news, nil, unique: [:session_hash])

    #他の最新記事
    @newsother=Newslist.where.not(id: params[:id]).order(created_at: :desc).first(5)

    #人気のニュース
    @favnews = Newslist.order('impressions_count DESC').first(4)


    #サイド最新レビュー
    @review = Review.order(id: "DESC").limit(5)

    #サイド最新記事
    @newnews= Newslist.order(created_at: :desc).first(10)
    @news_fav = Newslist.order('impressions_count DESC').first(5)

  end

  #検索
  def search
    #サイド最新レビュー
    @review = Review.order(id: "DESC").limit(5)

    #サイド最新記事
    @newnews= Newslist.order(created_at: :desc).first(7)
  end

end
