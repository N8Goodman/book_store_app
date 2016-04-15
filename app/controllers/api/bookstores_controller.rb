module API
  class BookstoresController < ApplicationController
    def show
      @bookstore = Bookstore.find(params[:id])
      @latitude = @bookstore.latitude
      @longitude = @bookstore.longitude
      if !@latitude.nil? && !@longitude.nil?
        render json: { latitude: @latitude, longitude: @longitude }
      else
        render json: { latitude: 15.9254, longitude:  69.3354 }
      end
    end
  end
end
