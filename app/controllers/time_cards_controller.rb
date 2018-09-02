class TimeCardsController < ApplicationController

 before_action :logged_in_user
 before_action :correct_but_admin_user, only: [:show]
  
  def show
    @user = User.find(params[:id])
    today = Date.today
    @year = today.year
    @month = today.month
    @time_cards = monthly_time_cards(@user, @year, @month)
    @time_card = TimeCard.today(@user)
  end
  
  def update
    @user = User.find(params[:id])
    @time_card = TimeCard.today(@user)
    ajax_show_action
    # render 'show'
    redirect_to current_user
  end
  

  private

    # 指定年月の全ての日のタイムカードの配列を取得する（タイムカードが存在しない日はnil）
    def monthly_time_cards(user, year, month)
      number_of_days_in_month = Date.new(year, month, 1).next_month.prev_day.day
      results = Array.new(number_of_days_in_month) # 月の日数分nilで埋めた配列を用意
      time_cards = TimeCard.monthly(user, year, month)
      time_cards.each do |card|
        results[card.day - 1] = card
      end
      results
    end

    # Ajaxでshowアクションが呼ばれた場合のハンドラ
    def ajax_show_action
      if params[:in]
        @time_card.in_at = Time.now
      elsif params[:out]
        @time_card.out_at = Time.now
      end
      
      @time_card.save

      # if @time_card.save
      #   render json: { status: 'success', time_card: @time_card, working_status: @time_card.working_status }
      # else
      #   render json: { status: 'error' }
      # end
    end 
    
    def correct_but_admin_user
      if current_user.admin?
      else
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
      end
    end

end
