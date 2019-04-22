class WinesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_wine, only: [:show, :edit, :update, :destroy]

  def index
    #binding.pry
    @wines = current_user.wines
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
    binding.pry

    #@wine = Wine.create(wine_params(:name, :vintage))
    @wine = Wine.create(name: wine_params[:name], vintage: wine_params[:vintage])
    @test = UsersWine.create({purchase_date: @somedate, wine: @wine, user: current_user})
    #@test = UsersWine.create({purchase_date: wine_params(:users_wines_attributes), wine: @wine, user: current_user})
    #@test = UsersWine.create({purchase_date: DateTime.new(2016, 03, 15, 18, 00, 0), wine: @wine, user: current_user})

    #binding.pry
    #binding.pry
    #@wine.users_wines.new(:wine_id ).where(id: current_user.id).users_wines_attributes = wine_params(:purchase_date)
    @wine.users << current_user unless @wine.users.include?(current_user)
    @wine.ratings.build(star: wine_params[:ratings][:star], wine_id: @wine.id, user_id: current_user.id)

    #binding.pry
    #binding.pry

    #binding.pry

    #@wine.ratings.build(star: wine_params(:ratings)[:ratings])

    #below works
    #@rating = Rating.new(star: wine_params(:ratings)[:ratings])
    #@rating.wine_id = @wine.id
    #@rating.user_id = current_user.id
    #@rating.save
    #@wine.ratings << @rating
    #above works
    #binding.pry


    if @wine.save
      redirect_to @wine, notice: "Successfully added a new wine!"
    else
      render 'new'
    end
  end

  private

  def wine_params
    #params.require(:wine).permit(*args)
    params.require(:wine).permit(:name, :vintage, ratings: [:star], users_wines_attributes: [:purchase_date])

  end

  def find_wine
    @wine = Wine.find(params[:id])
  end
end
