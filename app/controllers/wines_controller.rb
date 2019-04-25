class WinesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_wine, only: [:show, :edit, :update, :destroy]

  def index
    #binding.pry
    #
    @wines = current_user.wines

    #binding.pry
    @ratings = current_user.ratings
    #
  end



  def show

  end

  def wine_library
    @wine_library = Wine.all
    render 'library'
    #binding.pry
  end

  def new
    @wine = Wine.new

  end

  def create
     #binding.pry
    #@date_attributes = wine_params(users_wines_attributes: :purchase_date)
    @somedate = DateTime.new(wine_params[:users_wines_attributes]["purchase_date(1i)"].to_i,
                        wine_params[:users_wines_attributes]["purchase_date(2i)"].to_i,
                        wine_params[:users_wines_attributes]["purchase_date(3i)"].to_i,
                        wine_params[:users_wines_attributes]["purchase_date(4i)"].to_i,
                        wine_params[:users_wines_attributes]["purchase_date(5i)"].to_i)

    #@new_wine = current_user.wines.build(name: wine_params[:name], vintage: wine_params[:vintage],
      #ratings_attributes: {star: wine_params[:ratings_attributes][:star], user: current_user})

      @new_wine = current_user.wines.build(name: wine_params[:name], vintage: wine_params[:vintage])
      @new_wine.save
      @new_rating = Rating.new(star: wine_params[:ratings_attributes][:star], user_id: current_user.id, wine_id: @new_wine.id)
      @new_rating.save


      #current_user.save


      #@current_user_wine = UsersWine.find_by(user_id: current_user.id, wine_id: @new_wine.id).inspect
      @new_users_wine = UsersWine.new(purchase_date: @somedate, user: current_user, wine: @new_wine)
      @new_users_wine.save
      #@current_user_wine.update_attribute(user_id: current_user.id, purchase_date: @somedate)
      #@current_user_wine.update_attribute(:purchase_date, @somedate)



    if current_user.save
      redirect_to @new_wine, notice: "Successfully added a new wine!"
    else
      render 'new'
    end
  end

  def edit
    @wine = Wine.find(params[:id])
  end

  def update


    @wine = Wine.find(params[:id])
   #if @wine.update(name: wine_params[:name], vintage: wine_params[:vintage])

     @date = DateTime.new(wine_params[:users_wines_attributes]["purchase_date(1i)"].to_i,
                         wine_params[:users_wines_attributes]["purchase_date(2i)"].to_i,
                         wine_params[:users_wines_attributes]["purchase_date(3i)"].to_i,
                         wine_params[:users_wines_attributes]["purchase_date(4i)"].to_i,
                         wine_params[:users_wines_attributes]["purchase_date(5i)"].to_i)

                         binding.pry


        @wine.update(name: wine_params[:name], vintage: wine_params[:vintage])
        @wine.save

        @current_rating = Rating.find_by(user_id: current_user.id, wine_id: @wine.id)
        @current_rating.update_attribute(:star, wine_params[:ratings_attributes][:star])

         @current_user_wine = UsersWine.find_by(user_id: current_user.id, wine_id: @wine.id)
         @current_user_wine.update_attribute(:purchase_date, @date)



     if @wine.save
     redirect_to @wine
   else
     redirect_to edit_wine_path
   end
  end

  private

  def wine_params
    #params.require(:wine).permit(*args)
    params.require(:wine).permit(:name, :vintage, ratings_attributes: [:star], users_wines_attributes: [:purchase_date])

  end

  def find_wine
    @wine = Wine.find(params[:id])
  end
end
