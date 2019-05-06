class Admin::BanknotesController < Admin::BaseController

   def index
    @banknotes = Banknote.all
  end

  def edit
    @banknote = Banknote.first
  end

  def update
    @banknote = Banknote.find(params[:id])
    if @banknote.update_attributes(banknote_params)
      redirect_to @banknote, notice: 'Banknote was create'
    else
      render :edit, error: 'Banknote was not create'
    end
  end

  private

  def banknote_params
    params.require(:banknote).permit%i( hundred fifty twenty ten)
  end
end
