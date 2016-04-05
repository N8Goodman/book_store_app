class BookstoresController < ApplicationController

  def index
    @bookstores = Bookstore.all
  end

  def show
    @bookstore = Bookstore.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
