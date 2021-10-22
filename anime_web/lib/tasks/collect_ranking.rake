namespace :collect_ranking do



  desc "毎日行う処理"
  task :ranking_day => :environment do

  #----------------スコア代入処理-----------------------

    #アニメテーブル変数
    @anime = AnimeList.all

    @anime.each do |anime|

      #マイリス数集計
      @mylist_count = Mitalist.where(anime_id: anime.id).count

      #感想
      @review = Review.where(anime_id: anime.id)

      @review_count = @review.count
      @review_ave = @review.average(:total)
      @review_story = @review.average(:story)
      @review_draw = @review.average(:draw)
      @review_music = @review.average(:music)
      @review_voice = @review.average(:voice)
      @review_chara = @review.average(:chara)

      #総合ポイント
      @point = (((@mylist_count.to_i * 21)) + ((@review_count.to_i * 655)) + ((@review_ave.to_i * 899)))


      #既にランキングデータが有る場合
      if Ranking.find_by(anime_id: anime.id) != nil

        @data = Ranking.find_by(anime_id: anime.id)

        if anime.season != nil
        @data.season = anime.season
        end

       if anime.year != nil
         @data.year = anime.year
        end

        @data.mylist_count=@mylist_count
        @data.review_count=@review_count
        @data.ave_score = @review_ave
        @data.score_story = @review_story
        @data.score_write = @review_draw
        @data.score_music = @review_music
        @data.score_voice = @review_voice
        @data.score_char = @review_chara
        @data.total_point = @point

        @data.save


      #ランキングデータがない場合
      else

        @data = Ranking.new(anime_id: anime.id)

        if anime.season != nil
        @data.season = anime.season
      end

       if anime.year != nil
         @data.year = anime.year
       end

        @data.mylist_count=@mylist_count
        @data.review_count=@review_count
        @data.ave_score = @review_ave
        @data.score_story = @review_story
        @data.score_write = @review_draw
        @data.score_music = @review_music
        @data.score_voice = @review_voice
        @data.score_char = @review_chara
        @data.total_point = @point

        @data.save

    end
    end
    #----------------スコア代入処理終了-----------------------


    #---------------------全期間総合スコア処理--------------------


    #総合スコア昇順に並び替え
    @score_int = Ranking.order("total_point DESC")

    #順位初期値
    @rank = 1

    #入力処理
    @score_int.each do |anime|
        anime.rank_total = @rank
        anime.save
        @rank += 1
    end


    #評価昇順に並び替え
    @score_int = Ranking.order("ave_score DESC")

    #順位初期値
    @rank = 1

    #入力処理
    @score_int.each do |anime|
        anime.rank_ave = @rank
        anime.save
        @rank += 1
    end

    #マイリス昇順に並び替え
    @score_int = Ranking.order("mylist_count DESC")

    #順位初期値
    @rank = 1

    #入力処理
    @score_int.each do |anime|
        anime.rank_mylist = @rank
        anime.save
        @rank += 1
    end

    #コメント昇順に並び替え
    @score_int = Ranking.order("review_count DESC")

    #順位初期値
    @rank = 1

    #入力処理
    @score_int.each do |anime|
        anime.rank_review = @rank
        anime.save
        @rank += 1
    end

    #物語昇順に並び替え
    @score_int = Ranking.order("score_story DESC")

    #順位初期値
    @rank = 1

    #入力処理
    @score_int.each do |anime|
        anime.rank_story = @rank
        anime.save
        @rank += 1
    end

    #作画昇順に並び替え
    @score_int = Ranking.order("score_write DESC")

    #順位初期値
    @rank = 1

    #入力処理
    @score_int.each do |anime|
        anime.rank_write = @rank
        anime.save
        @rank += 1
    end

    #音楽昇順に並び替え
    @score_int = Ranking.order("score_music DESC")

    #順位初期値
    @rank = 1

    #入力処理
    @score_int.each do |anime|
        anime.rank_music = @rank
        anime.save
        @rank += 1
    end

    #声優昇順に並び替え
    @score_int = Ranking.order("score_voice DESC")

    #順位初期値
    @rank = 1

    #入力処理
    @score_int.each do |anime|
        anime.rank_voice = @rank
        anime.save
        @rank += 1
    end

    #キャラ昇順に並び替え
    @score_int = Ranking.order("score_char DESC")

    #順位初期値
    @rank = 1

    #入力処理
    @score_int.each do |anime|
        anime.rank_chara = @rank
        anime.save
        @rank += 1
    end



    #---------------------全期間総合スコア処理終了---------------------

  end #ranking_dayタスク終了





#-------シーズン別ランキング処理----------------

desc "シーズン別ランキング処理"
task :ranking_season => :environment do



    #---------------------2020年冬スコア処理--------------------

    #総合スコア昇順に並び替え
    @score_int = Ranking.where(season: 'winter').where(year: '2019').order("total_point DESC")
    @rank = 1
    @score_int.each do |anime|
        anime.rank_total_season = @rank
        anime.save
        @rank += 1
    end

    #評価昇順に並び替え
    @score_int = Ranking.where(season: 'winter').where(year: '2019').order("ave_score DESC")
    @rank = 1
    @score_int.each do |anime|
        anime.rank_ave_season = @rank
        anime.save
        @rank += 1
    end

    #マイリス昇順に並び替え
    @score_int = Ranking.where(season: 'winter').where(year: '2019').order("mylist_count DESC")
    @rank = 1
    @score_int.each do |anime|
        anime.rank_mylist_season = @rank
        anime.save
        @rank += 1
    end

    #コメント昇順に並び替え
    @score_int = Ranking.where(season: 'winter').where(year: '2019').order("review_count DESC")
    @rank = 1
    @score_int.each do |anime|
        anime.rank_review_season = @rank
        anime.save
        @rank += 1
    end

    #物語昇順に並び替え
    @score_int = Ranking.where(season: 'winter').where(year: '2019').order("score_story DESC")
    @rank = 1
    @score_int.each do |anime|
        anime.rank_story_season = @rank
        anime.save
        @rank += 1
    end

    #作画昇順に並び替え
    @score_int = Ranking.where(season: 'winter').where(year: '2019').order("score_write DESC")
    @rank = 1
    @score_int.each do |anime|
        anime.rank_write_season = @rank
        anime.save
        @rank += 1
    end

    #音楽昇順に並び替え
    @score_int = Ranking.where(season: 'winter').where(year: '2019').order("score_music DESC")
    @rank = 1
    @score_int.each do |anime|
        anime.rank_music_season = @rank
        anime.save
        @rank += 1
    end

    #声優昇順に並び替え
    @score_int = Ranking.where(season: 'winter').where(year: '2019').order("score_voice DESC")
    @rank = 1
    @score_int.each do |anime|
        anime.rank_voice_season = @rank
        anime.save
        @rank += 1
    end

    #キャラ昇順に並び替え
    @score_int = Ranking.where(season: 'winter').where(year: '2019').order("score_char DESC")
    @rank = 1
    @score_int.each do |anime|
        anime.rank_chara_season = @rank
        anime.save
        @rank += 1
    end

    #---------------------2019年冬スコア処理終了---------------------


  #---------------------2019年春スコア処理--------------------

  #総合スコア昇順に並び替え
  @score_int = Ranking.where(season: 'spring').where(year: '2019').order("total_point DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_total_season = @rank
      anime.save
      @rank += 1
  end

  #評価昇順に並び替え
  @score_int = Ranking.where(season: 'spring').where(year: '2019').order("ave_score DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_ave_season = @rank
      anime.save
      @rank += 1
  end

  #マイリス昇順に並び替え
  @score_int = Ranking.where(season: 'spring').where(year: '2019').order("mylist_count DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_mylist_season = @rank
      anime.save
      @rank += 1
  end

  #コメント昇順に並び替え
  @score_int = Ranking.where(season: 'spring').where(year: '2019').order("review_count DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_review_season = @rank
      anime.save
      @rank += 1
  end

  #物語昇順に並び替え
  @score_int = Ranking.where(season: 'spring').where(year: '2019').order("score_story DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_story_season = @rank
      anime.save
      @rank += 1
  end

  #作画昇順に並び替え
  @score_int = Ranking.where(season: 'spring').where(year: '2019').order("score_write DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_write_season = @rank
      anime.save
      @rank += 1
  end

  #音楽昇順に並び替え
  @score_int = Ranking.where(season: 'spring').where(year: '2019').order("score_music DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_music_season = @rank
      anime.save
      @rank += 1
  end

  #声優昇順に並び替え
  @score_int = Ranking.where(season: 'spring').where(year: '2019').order("score_voice DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_voice_season = @rank
      anime.save
      @rank += 1
  end

  #キャラ昇順に並び替え
  @score_int = Ranking.where(season: 'spring').where(year: '2019').order("score_char DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_chara_season = @rank
      anime.save
      @rank += 1
  end

  #---------------------2019年春スコア処理終了---------------------




  #---------------------2019年夏スコア処理--------------------

  #総合スコア昇順に並び替え
  @score_int = Ranking.where(season: 'summer').where(year: '2019').order("total_point DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_total_season = @rank
      anime.save
      @rank += 1
  end

  #評価昇順に並び替え
  @score_int = Ranking.where(season: 'summer').where(year: '2019').order("ave_score DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_ave_season = @rank
      anime.save
      @rank += 1
  end

  #マイリス昇順に並び替え
  @score_int = Ranking.where(season: 'summer').where(year: '2019').order("mylist_count DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_mylist_season = @rank
      anime.save
      @rank += 1
  end

  #コメント昇順に並び替え
  @score_int = Ranking.where(season: 'summer').where(year: '2019').order("review_count DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_review_season = @rank
      anime.save
      @rank += 1
  end

  #物語昇順に並び替え
  @score_int = Ranking.where(season: 'summer').where(year: '2019').order("score_story DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_story_season = @rank
      anime.save
      @rank += 1
  end

  #作画昇順に並び替え
  @score_int = Ranking.where(season: 'summer').where(year: '2019').order("score_write DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_write_season = @rank
      anime.save
      @rank += 1
  end

  #音楽昇順に並び替え
  @score_int = Ranking.where(season: 'summer').where(year: '2019').order("score_music DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_music_season = @rank
      anime.save
      @rank += 1
  end

  #声優昇順に並び替え
  @score_int = Ranking.where(season: 'summer').where(year: '2019').order("score_voice DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_voice_season = @rank
      anime.save
      @rank += 1
  end

  #キャラ昇順に並び替え
  @score_int = Ranking.where(season: 'summer').where(year: '2019').order("score_char DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_chara_season = @rank
      anime.save
      @rank += 1
  end

  #---------------------2019年夏スコア処理終了---------------------



  #---------------------2019年秋スコア処理--------------------

  #総合スコア昇順に並び替え
  @score_int = Ranking.where(season: 'autumn').where(year: '2019').order("total_point DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_total_season = @rank
      anime.save
      @rank += 1
  end

  #評価昇順に並び替え
  @score_int = Ranking.where(season: 'autumn').where(year: '2019').order("ave_score DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_ave_season = @rank
      anime.save
      @rank += 1
  end

  #マイリス昇順に並び替え
  @score_int = Ranking.where(season: 'autumn').where(year: '2019').order("mylist_count DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_mylist_season = @rank
      anime.save
      @rank += 1
  end

  #コメント昇順に並び替え
  @score_int = Ranking.where(season: 'autumn').where(year: '2019').order("review_count DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_review_season = @rank
      anime.save
      @rank += 1
  end

  #物語昇順に並び替え
  @score_int = Ranking.where(season: 'autumn').where(year: '2019').order("score_story DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_story_season = @rank
      anime.save
      @rank += 1
  end

  #作画昇順に並び替え
  @score_int = Ranking.where(season: 'autumn').where(year: '2019').order("score_write DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_write_season = @rank
      anime.save
      @rank += 1
  end

  #音楽昇順に並び替え
  @score_int = Ranking.where(season: 'autumn').where(year: '2019').order("score_music DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_music_season = @rank
      anime.save
      @rank += 1
  end

  #声優昇順に並び替え
  @score_int = Ranking.where(season: 'autumn').where(year: '2019').order("score_voice DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_voice_season = @rank
      anime.save
      @rank += 1
  end

  #キャラ昇順に並び替え
  @score_int = Ranking.where(season: 'autumn').where(year: '2019').order("score_char DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_chara_season = @rank
      anime.save
      @rank += 1
  end

  #---------------------2019年秋スコア処理終了---------------------



  #---------------------2020年冬スコア処理--------------------

  #総合スコア昇順に並び替え
  @score_int = Ranking.where(season: 'winter').where(year: '2020').order("total_point DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_total_season = @rank
      anime.save
      @rank += 1
  end

  #評価昇順に並び替え
  @score_int = Ranking.where(season: 'winter').where(year: '2020').order("ave_score DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_ave_season = @rank
      anime.save
      @rank += 1
  end

  #マイリス昇順に並び替え
  @score_int = Ranking.where(season: 'winter').where(year: '2020').order("mylist_count DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_mylist_season = @rank
      anime.save
      @rank += 1
  end

  #コメント昇順に並び替え
  @score_int = Ranking.where(season: 'winter').where(year: '2020').order("review_count DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_review_season = @rank
      anime.save
      @rank += 1
  end

  #物語昇順に並び替え
  @score_int = Ranking.where(season: 'winter').where(year: '2020').order("score_story DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_story_season = @rank
      anime.save
      @rank += 1
  end

  #作画昇順に並び替え
  @score_int = Ranking.where(season: 'winter').where(year: '2020').order("score_write DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_write_season = @rank
      anime.save
      @rank += 1
  end

  #音楽昇順に並び替え
  @score_int = Ranking.where(season: 'winter').where(year: '2020').order("score_music DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_music_season = @rank
      anime.save
      @rank += 1
  end

  #声優昇順に並び替え
  @score_int = Ranking.where(season: 'winter').where(year: '2020').order("score_voice DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_voice_season = @rank
      anime.save
      @rank += 1
  end

  #キャラ昇順に並び替え
  @score_int = Ranking.where(season: 'winter').where(year: '2020').order("score_char DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_chara_season = @rank
      anime.save
      @rank += 1
  end

  #---------------------2019年冬スコア処理終了---------------------



  #---------------------2020年春スコア処理--------------------

  #総合スコア昇順に並び替え
  @score_int = Ranking.where(season: 'spring').where(year: '2020').order("total_point DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_total_season = @rank
      anime.save
      @rank += 1
  end

  #評価昇順に並び替え
  @score_int = Ranking.where(season: 'spring').where(year: '2020').order("ave_score DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_ave_season = @rank
      anime.save
      @rank += 1
  end

  #マイリス昇順に並び替え
  @score_int = Ranking.where(season: 'spring').where(year: '2020').order("mylist_count DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_mylist_season = @rank
      anime.save
      @rank += 1
  end

  #コメント昇順に並び替え
  @score_int = Ranking.where(season: 'spring').where(year: '2020').order("review_count DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_review_season = @rank
      anime.save
      @rank += 1
  end

  #物語昇順に並び替え
  @score_int = Ranking.where(season: 'spring').where(year: '2020').order("score_story DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_story_season = @rank
      anime.save
      @rank += 1
  end

  #作画昇順に並び替え
  @score_int = Ranking.where(season: 'spring').where(year: '2020').order("score_write DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_write_season = @rank
      anime.save
      @rank += 1
  end

  #音楽昇順に並び替え
  @score_int = Ranking.where(season: 'spring').where(year: '2020').order("score_music DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_music_season = @rank
      anime.save
      @rank += 1
  end

  #声優昇順に並び替え
  @score_int = Ranking.where(season: 'spring').where(year: '2020').order("score_voice DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_voice_season = @rank
      anime.save
      @rank += 1
  end

  #キャラ昇順に並び替え
  @score_int = Ranking.where(season: 'spring').where(year: '2020').order("score_char DESC")
  @rank = 1
  @score_int.each do |anime|
      anime.rank_chara_season = @rank
      anime.save
      @rank += 1
  end

  #---------------------2019年春スコア処理終了---------------------

end
#-------シーズン別ランキング処理終了----------------



#-------ウィークリー処理---------

  desc "毎日行う処理"
  task :ranking_week => :environment do


    #ランキング初期化
    @ranking_init = Ranking.all
    @ranking_init.each do |init|
      init.rank_total_weekly = nil
      init.rank_ave_weekly = nil
      init.rank_mylist_weekly = nil
      init.rank_review_weekly = nil
      init.rank_story_weekly = nil
      init.rank_write_weekly = nil
      init.rank_music_weekly = nil
      init.rank_voice_weekly = nil
      init.rank_chara_weekly = nil
      init.save
    end

    #急上昇情報
    @review = Review.where(updated_at:1.weeks.ago..Time.now).group(:anime_id).order("count_all DESC").count.first(100)
    @mylist = Mitalist.where(updated_at:1.weeks.ago..Time.now).group(:anime_id).order("count_all DESC").count.first(100)





    #平均値処理--------

    #平均値格納ハッシュ初期化
    @ave_hash = {}

    #一時的に平均値を格納ループ
    @review.each do |anime_id, count|
      review_get = Review.where(anime_id: anime_id).where(updated_at:1.weeks.ago..Time.now)
      ave_puts = review_get.average(:total)
      @ave_hash[anime_id] = ave_puts
    end

    #ランキング代入
    @rank = 1
    @ave_hash.sort_by{ |_, v| -v }.each do |anime_id,ave|
      rankings = Ranking.find_by(anime_id: anime_id)
      rankings.rank_ave_weekly = @rank
      rankings.save
      @rank += 1
    end

    #平均値処理終了--------


    #story処理--------

    #story平均値格納ハッシュ初期化
    @str_hash = {}

    #一時的にstory平均値を格納ループ
    @review.each do |anime_id, count|
      review_get = Review.where(anime_id: anime_id).where(updated_at:1.weeks.ago..Time.now)
      ave_puts = review_get.average(:story)
      @str_hash[anime_id] = ave_puts
    end

    #ランキング代入
    @rank = 1
    @str_hash.sort_by{ |_, v| -v }.each do |anime_id,ave|
      rankings = Ranking.find_by(anime_id: anime_id)
      rankings.rank_story_weekly = @rank
      rankings.save
      @rank += 1
    end

    #story処理終了--------

    #write処理--------

    #write平均値格納ハッシュ初期化
    @wrt_hash = {}

    #一時的にwrite平均値を格納ループ
    @review.each do |anime_id, count|
      review_get = Review.where(anime_id: anime_id).where(updated_at:1.weeks.ago..Time.now)
      ave_puts = review_get.average(:draw)
      @wrt_hash[anime_id] = ave_puts
    end

    #ランキング代入
    @rank = 1
    @wrt_hash.sort_by{ |_, v| -v }.each do |anime_id,ave|
      rankings = Ranking.find_by(anime_id: anime_id)
      rankings.rank_write_weekly = @rank
      rankings.save
      @rank += 1
    end

    #write処理終了--------

    #music処理--------

    #music平均値格納ハッシュ初期化
    @msc_hash = {}

    #一時的にmusic平均値を格納ループ
    @review.each do |anime_id, count|
      review_get = Review.where(anime_id: anime_id).where(updated_at:1.weeks.ago..Time.now)
      ave_puts = review_get.average(:music)
      @msc_hash[anime_id] = ave_puts
    end

    #ランキング代入
    @rank = 1
    @msc_hash.sort_by{ |_, v| -v }.each do |anime_id,ave|
      rankings = Ranking.find_by(anime_id: anime_id)
      rankings.rank_music_weekly = @rank
      rankings.save
      @rank += 1
    end

    #music処理終了--------

    #voice処理--------

    #voice平均値格納ハッシュ初期化
    @vic_hash = {}

    #一時的にvoice平均値を格納ループ
    @review.each do |anime_id, count|
      review_get = Review.where(anime_id: anime_id).where(updated_at:1.weeks.ago..Time.now)
      ave_puts = review_get.average(:voice)
      @vic_hash[anime_id] = ave_puts
    end

    #ランキング代入
    @rank = 1
    @vic_hash.sort_by{ |_, v| -v }.each do |anime_id,ave|
      rankings = Ranking.find_by(anime_id: anime_id)
      rankings.rank_voice_weekly = @rank
      rankings.save
      @rank += 1
    end

    #voice処理終了--------

    #voice処理--------

    #chara平均値格納ハッシュ初期化
    @chr_hash = {}

    #一時的にchara平均値を格納ループ
    @review.each do |anime_id, count|
      review_get = Review.where(anime_id: anime_id).where(updated_at:1.weeks.ago..Time.now)
      ave_puts = review_get.average(:voice)
      @chr_hash[anime_id] = ave_puts
    end

    #ランキング代入
    @rank = 1
    @chr_hash.sort_by{ |_, v| -v }.each do |anime_id,ave|
      rankings = Ranking.find_by(anime_id: anime_id)
      rankings.rank_chara_weekly = @rank
      rankings.save
      @rank += 1
    end

    #chara処理終了--------

    #感想数
      @rank = 1
      @review.each do |anime_id, count|
        rankings = Ranking.find_by(anime_id: anime_id)
        rankings.rank_review_weekly = @rank
        rankings.save
        @rank += 1
      end

      #マイリス数急上昇
      @rank = 1
      @mylist.each do |anime_id, count|
        rankings = Ranking.find_by(anime_id: anime_id)
        rankings.rank_mylist_weekly = @rank
        rankings.save
        @rank += 1
      end

      #総合スコア処理--------

      #総合スコア格納ハッシュ初期化
      @total_hash = {}

      #total_puts = (count_my) + (count_rv) + (count_ave.to_i * 899)

      #一時的に総合スコアを格納ループ
      @ave_hash.sort_by{ |_, v| -v }.each do |anime_id, review_ave|
        @count_rv = Review.where(anime_id: anime_id).where(created_at:1.weeks.ago..Time.now).count
        @count_rv = @count_rv.to_i * 655
        @count_ave = review_ave.to_i * 899

        if Mitalist.where(anime_id: anime_id).where(updated_at:1.weeks.ago..Time.now) != nil
          @count_my = Mitalist.where(anime_id: anime_id).where(updated_at:1.weeks.ago..Time.now).count
          @count_my = @count_my * 21
        end

        total_puts = @count_rv.to_i + @count_ave.to_i + @coun_my.to_i
        @total_hash[anime_id] = total_puts
      end

      #ランキング代入
      @rank = 1
      @total_hash.sort_by{ |_, v| -v }.each do |anime_id,ave|
        rankings = Ranking.find_by(anime_id: anime_id)
        rankings.rank_total_weekly = @rank
        rankings.save
        @rank += 1
      end

      #総合スコア処理終了--------



  end

end
