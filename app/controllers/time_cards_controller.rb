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
    @first_day = Date.new(@year, @month, 1)
    @last_day = Date.new(@year, @month, 1).next_month.prev_day
    @time_info = TimeInfo.all.last
    
    store(@year,@month)
  end
  
  def update
    @user = User.find(params[:id])
    @time_card = TimeCard.today(@user)
    ajax_show_action
    # render 'show'
    redirect_to current_user
  end
  
  def new
    @time_info = TimeInfo.new
  end
  
  def create
    
    # @time_info = TimeInfo.new(must_work_time: params[:must_work_time], sd_work_time: params[:sd_work_time])
     @time_info = TimeInfo.new(time_info_params)
    if @time_info.save
      redirect_to current_user
    else
      redirect_to root_path
    end

  end
  
  
  def add
    @user = User.find(params[:id])
    @year = session[:year]
    @month = session[:month] + 1
    if @month == 13
      @year = @year + 1
      @month = 1
    end
    @first_day = Date.new(@year, @month, 1)
    @last_day = Date.new(@year, @month, 1).next_month.prev_day
    @time_cards = monthly_time_cards(@user, @year, @month)
    store(@year,@month)
    @time_card = TimeCard.today(@user)
    render 'show'  
  end
  
  def subtract
    @user = User.find(params[:id])
    @year = session[:year]
    @month = session[:month] - 1
    if @month == 0
      @year = @year - 1
      @month = 12
    end
    @first_day = Date.new(@year, @month, 1)
    @last_day = Date.new(@year, @month, 1).next_month.prev_day
    @time_cards = monthly_time_cards(@user, @year, @month)
    store(@year,@month)
    @time_card = TimeCard.today(@user)
    render 'show'  
  end
  
  def store(year,month)
       session[:year] = year
       session[:month] = month
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
    
    def time_info_params
      params.require(:time_info).permit(:must_work_time,:sd_work_time) 
                                   
    end

end
