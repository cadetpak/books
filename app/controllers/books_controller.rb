class BooksController < ApplicationController
  def new
  #automatically loads new.html.erb
  end

  #creates new book
  def create
  	@book = Book.new(title: params[:title], author: params[:author])
  	if @book.save
  	  @category = Category.create(status: params[:category], user: User.find(params[:user]), book: Book.find(
  	  	@book.id))
  	  redirect_to '/dashboard'
  	else
  	  flash[:errors] = @book.errors.full_messages
  	  redirect_to :back
  	end
  end

  #changes book from current to finished
  def update
    category1 = Category.find(params[:id])
    category1.update(status: params[:status])
    redirect_to '/dashboard'
  end

  #drops book from current to dropped
  def destroy
    Category.find(params[:id]).destroy
    redirect_to '/dashboard'
  end


end
