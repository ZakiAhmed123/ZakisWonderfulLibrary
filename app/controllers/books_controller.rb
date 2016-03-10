class BooksController < ApplicationController
  def index
    @books=Book.all.order("title asc")
    end

  def view
    @book = Book.find_by id: params[:id]
  end

  def new
    @book = Book.new
  end

  def create
    # instantiate a blank Book object
    @book = Book.new
    # set the values
    @book.title = params[:book][:title]
    @book.author_id = params[:book][:author_id]
    @book.photo = params[:book][:photo_id]
    @book.price = params[:book][:price]
    # save it
    if @book.save
      # redirect to "/books"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @book = Book.find_by id: params[:id]
  end

  def update
      # instantiant / Find
      @book = Book.find_by id: params[:id]
      # set values
      @book.title = params[:book][:title]
      @book.author_id = params[:book][:author_id]
      @book.photo_id = params[:book][:photo_id]
      @book.price = params[:book][:price]
      # save it
      if @book.save
        # redirect to "/books"
        redirect_to book_path(id: @book.id)
      else
        render :edit
      end
    end

    def delete
      # get the record
      @book = Book.find_by id: params[:id]
      # destroy the record
      @book.destroy
      # redirect away
      redirect_to root_path
    end


end
