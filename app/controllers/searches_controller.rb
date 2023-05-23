class SearchesController < ApplicationController

  def search
    @records = Item.looks(params[:word])
  end

end
