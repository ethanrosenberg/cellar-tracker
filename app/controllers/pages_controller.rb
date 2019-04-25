class PagesController < ApplicationController


  def search

  end

  def results

    if params[:search].blank?
      redirect_to('/search', alert: "Empty field!")
    else
      @parameter = params[:search].downcase

      @results = []
      Wine.all.each do |wine|
        #binding.pry
        if wine.name.downcase.include? @parameter.to_s
          @results << wine
        end
      end
      #@results = Wine.where("name like ?", "%#{@parameter}%")
    end
  end



end
