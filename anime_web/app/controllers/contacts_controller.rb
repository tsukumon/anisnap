class ContactsController < ApplicationController
  def new
    @contact = Contact.new

    #サイド最新レビュー
    @review = Review.order(id: "DESC").limit(5)
    @review_fav = Review.order('good_count DESC').first(6)

    #サイド最新記事
    @new_tyoko=Alert.order(id: 'DESC').first(10)

  end

  def create

    @contact = Contact.new(name: params[:name], email: params[:email], subject: params[:subject], message: params[:message])
    @contact.save

    if @contact.save
      MailSenderMailer.inquiry(@contact).deliver
      redirect_to("/")
    else
      redirect_to("/contacts")
    end

end

end
