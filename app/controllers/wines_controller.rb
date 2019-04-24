class WinesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_wine, only: [:show, :edit, :update, :destroy]

  def index
    #binding.pry
    #
    @wines = current_user.wines
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



    #binding.pry



    #@wine = Wine.create(wine_params(:name, :vintage))
    @new_wine = current_user.wines.build(name: wine_params[:name], vintage: wine_params[:vintage],
      ratings_attributes: {star: wine_params[:ratings_attributes][:star], user: current_user})

      current_user.save



      @current_user_wine = UsersWine.find_by(user_id: current_user.id, wine_id: @new_wine.id)
      #@new_wine = UsersWine.build(users_wines_attributes: {purchase_date: @somedate, user: current_user})
      #@current_user_wine.update_attribute(user_id: current_user.id, purchase_date: @somedate)
      @current_user_wine.update_attribute(:purchase_date, @somedate)




      #

    #  @current_user_wine.purchase_date = wine_params[:users_wines_attributes]



      #@curent_user_wines.update_attribute(user_id: current_user.id, wine_id: current_user.wines.last, purchase_date: @somedate)

    #@test = UsersWine.create({purchase_date: @somedate, wine: @wine, user: current_user})
    #@test = UsersWine.create({purchase_date: wine_params(:users_wines_attributes), wine: @wine, user: current_user})
    #@test = UsersWine.create({purchase_date: DateTime.new(2016, 03, 15, 18, 00, 0), wine: @wine, user: current_user})

    #binding.pry
    #binding.pry
    #@wine.users_wines.new(:wine_id ).where(id: current_user.id).users_wines_attributes = wine_params(:purchase_date)
    #@wine.users << current_user unless @wine.users.include?(current_user)
    #@wine.ratings.build(star: wine_params[:ratings_attributes][:star], wine_id: @wine.id, user_id: current_user.id)
    #@wine.ratings.build(star: wine_params[:ratings][:star], wine_id: @wine.id, user_id: current_user.id)


    if current_user.save && @current_user_wine.save
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
   if @wine.update(name: wine_params[:name], vintage: wine_params[:vintage])

     @date = DateTime.new(wine_params[:users_wines_attributes]["purchase_date(1i)"].to_i,
                         wine_params[:users_wines_attributes]["purchase_date(2i)"].to_i,
                         wine_params[:users_wines_attributes]["purchase_date(3i)"].to_i,
                         wine_params[:users_wines_attributes]["purchase_date(4i)"].to_i,
                         wine_params[:users_wines_attributes]["purchase_date(5i)"].to_i)

    #binding.pry

     @users_wines = UsersWine.find_by(wine_id: @wine.id, user_id: current_user.id)
     @users_wines.update(purchase_date: @date, wine_id: @wine.id, user_id: current_user.id)
     @rating = Rating.find_by(wine_id: @wine.id, user_id: current_user.id)
     @rating.update(star: wine_params[:ratings_attributes][:star], wine_id: @wine.id, user_id: current_user.id)

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
