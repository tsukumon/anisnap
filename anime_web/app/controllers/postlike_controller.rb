class PostlikeController < ApplicationController
  before_action :authenticate_user
  protect_from_forgery :except => [:create,:destroy]

  def create

    @reviewnow=Review.find_by(id: params[:review_id])

    #書き換え
    if Postlike.find_by(review_id: params[:review_id], user_id: current_user.id) != nil
      @like = Postlike.find_by(review_id: params[:review_id], user_id: current_user.id)

      @like.like= params[:state]
      @like.save

      if @like.like == 'good'
        @count = Review.find_by(id: params[:review_id])
        @count.good_count -= 1
        @count.save
      end


      #投稿されたコメント削除
      @count_bad = Postlike.where(review_id: params[:review_id], like: 'bad').count
      if @like.save and @count_bad >= 10
        @destroy_review = Review.find_by(id: params[:review_id])
        @destroy_review.destroy
        if @destroy_review.destroy
          @newlog = UserlogMylist.find_by(review_id: params[:review_id])
          @newlog.destroy
        end
      end

    #新規作成
    else
      @like = Postlike.new(review_id: params[:review_id], user_id: current_user.id, like: params[:state])
      @like.save

      if @like.like == 'good'
        @count = Review.find_by(id: params[:review_id])
        @count.good_count += 1
        @count.save
      end


      #投稿されたコメント削除
      @count_bad = Postlike.where(review_id: params[:review_id], like: 'bad').count
      if @like.save and @count_bad >= 10
        @destroy_review = Review.find_by(id: params[:review_id])
        @destroy_review.destroy
        if @destroy_review.destroy
          @newlog = UserlogMylist.find_by(review_id: params[:review_id])
          @newlog.destroy
        end
      end


    end

  end

  def destroy

    @reviewnow=Review.find_by(id: params[:review_id])

    @like = Postlike.find_by(review_id: params[:review_id], user_id: current_user.id)
    @like.destroy

  end

end
