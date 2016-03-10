class AuthorsController < ApplicationController
    def index
      @authors=Author.all.order("first_name asc")
    end

    def view
      @author = Author.find_by id: params[:id]
    end

    def new
      @author = Author.new
    end

    def create
      # instantiate a blank author object
      @author = Author.new
      # set the values
      @author.first_name = params[:author][:first_name]
      @author.last_name = params[:author][:last_name]
      @author.bio = params[:author][:bio]
      @author.photo_id = params[:author][:photo_id]
      # save it
      if @author.save
        # redirect to "/authors"
        redirect_to authors_path
      else
        render :new
      end
    end

    def edit
      @author = Author.find_by id: params[:id]
    end

    def update
        # instantiant / Find
        @author = Author.find_by id: params[:id]
        # set values
        @author.first_name = params[:author][:first_name]
        @author.last_name = params[:author][:last_name]
        @author.photo_id = params[:author][:photo_id]
        @author.bio = params[:author][:bio]

        # save it
        if @author.save
          # redirect to "/authors"
          redirect_to author_path(id: @author.id)
        else
          render :edit
        end
      end

    def delete
      @author = Author.find_by id: params[:id]
      @author.destroy
      redirect_to authors_path
    end

  end
