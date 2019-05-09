class Admin::BanknotesController < Admin::BaseController

   def index
    @banknotes = Banknote.all
  end

  def edit
    @banknote = Banknote.find(params[:id])
  end

  def update
    @banknote = Banknote.find(params[:id])
    if @banknote.update(banknote_params)
      redirect_to  admin_root_url, notice: 'Banknote was create'
    else
      render :edit, error: 'Banknote was not create'
    end
  end

  private

  def banknote_params
    params.require(:banknote).permit(:name, :quantity)
  end
end
