class SpellsController < ApplicationController
  before_action :set_spells, only: [:show, :edit, :update, :destroy]
  def index
    @spells = Spell.all
    @keyword = Spell.photo_keyword
    photo
  end

  def new
    @spell = Spell.new
  end

  def create
    @spell = Spell.new(spell_params)
    
    if @spell.save
      redirect_to spells_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @spell = Spell.find(params[:id])
    @spell.update(spell_params)

    redirect_to spell_path(@spell)
  end

  def show
    @spell = Spell.find(params[:id])
  end

  def destroy
    @spell = Spell.find(params[:id])
    @spell.destroy

    redirect_to spells_path
  end

  def categoires
    @spells = Spell.where
    Spell.all.each do |item|
      @categories << item.kind
    end
    return @categoires
  end
  

  private

  def spell_params
    params.require(:spell).permit(:name, :kind, :level, :photo)
  end

  def set_spells
    @spell = Spell.find(params[:id])
  end

  def photo
    # return Unsplash::Photo.search(kind).first[:urls][:raw]
  end
  
end
