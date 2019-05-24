class PagesController < ApplicationController


  def search

  end

  def results

    if params[:search].blank?

      redirect_to '/search'
    else

      binding.pry
      @parameter = params[:search].downcase

      @results = []
      Wine.all.each do |wine|
        #binding.pry
        if wine.name.downcase.include? @parameter.to_s
          @results << wine
        end
      end
      if @results
        flash[:success] = "This works!"
      else
        flash[:success] = "No Results Found!"
      end
      #@results = Wine.where("name like ?", "%#{@parameter}%")
    end

    respond_to do |format|
       format.html { render :search }
       format.json { render json: @results }
     end

  end



end
