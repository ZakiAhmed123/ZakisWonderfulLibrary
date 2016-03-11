class BooksController < ApplicationController

  def index
    @books=Book.all.order("title asc")
    end

  def view
    @current_user = User.find_by id: session[:user_id]
    if @current_user.blank?
      redirect_to sign_in_path
    end
    @book = Book.find_by id: params[:id]
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new
    @book.title = params[:book][:title]
    @book.author_id = params[:book][:author_id]
    @book.photo_id = params[:book][:photo_id]
    @book.price = params[:book][:price]
    if @book.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @book = Book.find_by id: params[:id]
  end

  def update
      @book = Book.find_by id: params[:id]
      @book.title = params[:book][:title]
      @book.author_id = params[:book][:author_id]
      @book.photo_id = params[:book][:photo_id]
      @book.price = params[:book][:price]
      if @book.save
        redirect_to book_path(id: @book.id)
      else
        render :edit
      end
    end

    def delete
      @book = Book.find_by id: params[:id]
      @book.destroy
      redirect_to root_path
    end


end
