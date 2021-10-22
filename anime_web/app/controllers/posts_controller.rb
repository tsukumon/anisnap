class PostsController < ApplicationController



  def page

    #アニメ情報
    @post=AnimeList.find_by(id: params[:id])

      @ranking = Ranking.find_by(anime_id: params[:id])



    #レビュー
    @review_now = Review.where(anime_id: params[:id])

    #サイド最新レビュー
    @review = Review.order(id: "DESC").limit(5)
    #サイド最新記事
    @new_tyoko=Alert.order(id: 'DESC').first(10)
    @review_fav = Review.order('good_count DESC').first(6)

  end

  def episode

    #アニメ情報
    @post=AnimeList.find_by(id: params[:id])

    @ranking = Ranking.find_by(anime_id: params[:id])

    #サイド最新レビュー
    @review = Review.order(id: "DESC").limit(5)

    #サイド最新記事
    @new_tyoko=Alert.order(id: 'DESC').first(10)
    @review_fav = Review.order('good_count DESC').first(6)

    @episodes =Episodelist.where(anime_id: @post.id)


  end


  def otherkansou
    #アニメ情報
    @post=AnimeList.find_by(id: params[:id])

    #カウント
    @ranking = Ranking.find_by(anime_id: params[:id])

    #サイド最新レビュー
    @review = Review.order(id: "DESC").limit(5)

    #サイド最新記事
    @new_tyoko=Alert.order(id: 'DESC').first(10)
    @review_fav = Review.order('good_count DESC').first(6)

    @kandatails = Review.where(anime_id: @post.id, state: params[:state_id]).order(created_at: 'desc')

    @episode=Episodelist.where(anime_id: @post.id)

end

def destroy_post

  @kansou = Review.find_by(id: params[:destroy_id])

  #感想を書いたアニメの情報一時保存
  kansou_write_anime = @kansou.anime_id
  kansou_state_anime = @kansou.state


    if  current_user != nil && current_user.id == @kansou.user_id
      #削除処理
      @kansou.destroy

      if @kansou.destroy
          @newlog = UserlogMylist.find_by(review_id: params[:destroy_id])
          @newlog.destroy

          redirect_to("/posts/anime/#{kansou_write_anime}/review=#{kansou_state_anime}")
      end


      end

end


  def items
    #アニメ情報
    @post=AnimeList.find_by(id: params[:id])

    #カウント
    @ranking = Ranking.find_by(anime_id: params[:id])

    #サイド最新レビュー
    @review = Review.order(id: "DESC").limit(5)

    #サイド最新記事
    @new_tyoko=Alert.order(id: 'DESC').first(10)
    @review_fav = Review.order('good_count DESC').first(6)


  end




  end
