class SidebarController < ApplicationController

  def sidebar

        #サイド最新レビュー
        @review = Review.order(id: "DESC").limit(5)

        #サイド最新記事
        @newnews= Newslist.order(created_at: :desc).first(7)


end

end
