class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @spell = Spell.find(params[:spell_id])
  end

  def create
    @spell = Spell.find(params[:spell_id])
    @dose = Dose.new(doses_params)
    @dose.spell_id = @spell.id

    if @dose.save
      redirect_to spell_path(@spell)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to spell_path(@dose)
  end
  
  private

  def doses_params
    params.require(:dose).permit(:instructions, :ingredient_id)
  end
  
  
end
