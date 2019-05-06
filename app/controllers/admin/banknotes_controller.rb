class Admin::BanknotesController < Admin::BaseController

   def index
    @banknotes = Banknote.all
  end

  def edit

  end

  def update
    @banknote = Banknote(banknote_params)
    if @banknote.save?
      redirect_to @banknote, notice: 'Topic was create'
    else
      render :edit, error: 'Banknote was not create'
    end
  end

  private

  def banknote_params
    params.require(:banknote).permit%i( hundred fifty twenty ten)
  end
end
