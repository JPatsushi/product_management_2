class MonthlyAuthenticationsController < ApplicationController
  
  def update
    
    today = Time.current
    @year = today.year
    @month = today.month
    
    @user = User.find(params[:id])
    @monthly_authentication = @user.monthly_authentications.find_by(year: @year, month: @month)
    @monthly_authentication.update_attributes(certifier: params[:superior_man], status: "申請中")
    
    redirect_to time_card_path(@user)
  end
  
  private
  
    def monthly_authentication_params
      params.require(:monthly_authentication).permit(:superior)
                                  
    end
end
