class SearchesController < ApplicationController

  def search
    @records = Item.looks(params[:word])
    @word = params[:word]
    @genres = Genre.all
  end

end
