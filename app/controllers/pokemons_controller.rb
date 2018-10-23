class PokemonsController < ApplicationController
  def capture
    @id = params[:id]
    Pokemon.update(@id, :trainer_id => current_trainer.id)
    redirect_to root_path
  end

  def damage
    @id = params[:pokemon_id]
    curr_pokemon = Pokemon.find(@id)
    new_health = curr_pokemon.health - 10
    if new_health <= 0
      Pokemon.destroy(@id)
    else
      Pokemon.update(@id, :health => new_health)
    end
    redirect_to '/trainers/' + params[:trainer_id]
  end

  def new
    @pokemon = Pokemon.new
    @msg = params[:msg]
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.name.nil? || @pokemon.name.empty?
      error_msg = "You cannot leave the pokemon name empty."
      flash[:error] = error_msg
      redirect_to new_path
    elsif Pokemon.where(:name => @pokemon.name).any?
      error_msg = "The name cannot be matching with an pre-existing pokemon name."
      flash[:error] = error_msg
      redirect_to new_path
    elsif @pokemon.ndex.nil? ||  @pokemon.ndex.empty?
      error_msg = "Pick a pokemon you want to create."
      flash[:error] = error_msg
      redirect_to new_path
    else
      @pokemon.trainer_id = current_trainer.id
      @pokemon.health = 100
      @pokemon.level = 1
      @pokemon.save
      redirect_to '/trainers/' + current_trainer.id.to_s
    end
  end

  def pokemon_params
    params.require(:pokemon).permit(:name, :ndex)
  end
end
