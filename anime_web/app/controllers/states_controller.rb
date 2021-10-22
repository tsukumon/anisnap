class StatesController < ApplicationController

    before_action :authenticate_user
    protect_from_forgery :except => [:create,:create_active,:create_mobile,:create_mobile_act]

  def create
    @post=AnimeList.find_by(id: params[:id])

    #削除処理
    if params[:state_id] == '0'

      @state = Mitalist.find_by(
        user_id: current_user.id,
        anime_id: params[:id]
      )

      @state.destroy

    #書き換え新規作成処理
    else

    #分岐
    if Mitalist.find_by(user_id: current_user.id,anime_id: params[:id]) != nil

      #バリデーション
      if params[:state_id] =='1' or params[:state_id] =='2' or params[:state_id] =='3' or params[:state_id] =='4' or params[:state_id] =='5'

      @state = Mitalist.find_by(user_id: current_user.id,anime_id: params[:id])

      @state.state = params[:state_id]

      @state.save

      #行動ログ入力
      if @state.save
        @newlog = UserlogMylist.new(user_id: @state.user_id, anime_id: @state.anime_id, state: @state.state)
        @newlog.save
      end

    end


    else

      #バリデーション
      if params[:state_id] =='1' or params[:state_id] =='2' or params[:state_id] =='3' or params[:state_id] =='4' or params[:state_id] =='5'

      #新規作成
    @state = Mitalist.new(
      user_id: current_user.id,
      anime_id: params[:id],
      state: params[:state_id]
    )
    @state.save

    #行動ログ入力
    if @state.save
      @newlog = UserlogMylist.new(user_id: @state.user_id, anime_id: @state.anime_id, state: @state.state)
      @newlog.save
    end
  end

  end

  end

  end




  def destroy
    @state = Mitalist.find_by(
      user_id: current_user.id,
      anime_id: params[:id]
    )

    @state.destroy

  end






  def create_active
    @anime_info=AnimeList.find_by(id: params[:id])

    #削除処理
    if params[:state_id] == '0'

      @state = Mitalist.find_by(
        user_id: current_user.id,
        anime_id: params[:id]
      )

      @state.destroy

    #書き換え新規作成処理
    else

    #分岐
    if Mitalist.find_by(user_id: current_user.id,anime_id: params[:id]) != nil

      @state = Mitalist.find_by(user_id: current_user.id,anime_id: params[:id])

      @state.state = params[:state_id]

      @state.save

      #行動ログ入力
      if @state.save
        @newlog = UserlogMylist.new(user_id: @state.user_id, anime_id: @state.anime_id, state: @state.state)
        @newlog.save
      end


    else
      #新規作成
    @state = Mitalist.new(
      user_id: current_user.id,
      anime_id: params[:id],
      state: params[:state_id]
    )
    @state.save

    #行動ログ入力
    if @state.save
      @newlog = UserlogMylist.new(user_id: @state.user_id, anime_id: @state.anime_id, state: @state.state)
      @newlog.save
    end

  end

  end

  end



  def create_mobile
    @post=AnimeList.find_by(id: params[:id])

    #削除処理
    if params[:state_id] == '0'

      @state = Mitalist.find_by(
        user_id: current_user.id,
        anime_id: params[:id]
      )

      @state.destroy

    #書き換え新規作成処理
    else

    #分岐
    if Mitalist.find_by(user_id: current_user.id,anime_id: params[:id]) != nil

      @state = Mitalist.find_by(user_id: current_user.id,anime_id: params[:id])

      @state.state = params[:state_id]

      @state.save

      #行動ログ入力
      if @state.save
        @newlog = UserlogMylist.new(user_id: @state.user_id, anime_id: @state.anime_id, state: @state.state)
        @newlog.save
      end


    else
      #新規作成
    @state = Mitalist.new(
      user_id: current_user.id,
      anime_id: params[:id],
      state: params[:state_id]
    )
    @state.save

    #行動ログ入力
    if @state.save
      @newlog = UserlogMylist.new(user_id: @state.user_id, anime_id: @state.anime_id, state: @state.state)
      @newlog.save
    end

  end

  end

  end



  def create_mobile_act
    @anime_info=AnimeList.find_by(id: params[:id])

    #削除処理
    if params[:state_id] == '0'

      @state = Mitalist.find_by(
        user_id: current_user.id,
        anime_id: params[:id]
      )

      @state.destroy

    #書き換え新規作成処理
    else

    #分岐
    if Mitalist.find_by(user_id: current_user.id,anime_id: params[:id]) != nil

      @state = Mitalist.find_by(user_id: current_user.id,anime_id: params[:id])

      @state.state = params[:state_id]

      @state.save

      #行動ログ入力
      if @state.save
        @newlog = UserlogMylist.new(user_id: @state.user_id, anime_id: @state.anime_id, state: @state.state)
        @newlog.save
      end


    else
      #新規作成
    @state = Mitalist.new(
      user_id: current_user.id,
      anime_id: params[:id],
      state: params[:state_id]
    )
    @state.save

    #行動ログ入力
    if @state.save
      @newlog = UserlogMylist.new(user_id: @state.user_id, anime_id: @state.anime_id, state: @state.state)
      @newlog.save
    end

  end

  end

  end


end
