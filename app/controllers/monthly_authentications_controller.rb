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
  
  def monthly_update
  # byebug
    @monthly_authentications = MonthlyAuthentication.where(certifier: current_user.id)
    
      # (2018..2025).each do |year|
      #   (1..12).each do |month|
          @monthly_authentications.each do |obj|
            if params[obj.user.id.to_s][obj.year.to_s] && params[obj.user.id.to_s][obj.year.to_s][obj.month.to_s] 
              if params[obj.user.id.to_s][obj.year.to_s][obj.month.to_s][:status] && params[obj.user.id.to_s][obj.year.to_s][obj.month.to_s][:check] == "1"        
                obj.status = params[obj.user.id.to_s][obj.year.to_s][obj.month.to_s][:status]
                obj.save
              end
            end
        #   end 
        # end
      end
      redirect_to time_card_path(id: current_user.id)
  end
  
  private
  
    def monthly_authentication_params
      params.require(:monthly_authentication).permit(:superior, :year, :month, :status)
                                  
    end
end
