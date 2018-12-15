class ProductsController < ApplicationController
  before_action :set_products, only: [:search, :export_csv] #2.2_A
  
  #サーチフォーム
  # def index
  #   @product = Search::Product.new
  # end
  
  #1.4
  # def index
  #   @q = Product.search
  # end
  
  #2.2_A,B
  def index
    @q = Product.search
  end
  
  #1.5
  # def index
  #   @products = Product.all
  # end
  
  def new
    @product = Form::Product.new
  end
  
  def edit
    @product = Form::Product.find(params[:id])
  end
  
  def create
    @product = Form::Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: "商品 #{@product.name} を登録しました。"
    else
      render :new
    end
  end
  
  def update
    @product = Form::Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to products_path, notice: "商品 #{@product.name} を更新しました。"
    else
      render :edit
    end
  end
  #/1.5
  
  #サーチフォーム
  # def search
  #   @product = Search::Product.new(search_params)
  #   @products = @product
  #     .matches
  #     .order(availability: :desc, code: :asc)
  #     .decorate
  # end
  
  # def search
  #   @q = Product.search(search_params)
  #   @products = @q
  #     .result
  #     .order(availability: :desc, code: :asc)
  #     .decorate
  # end
  
  #2.2_A
  # def search
  #   @q = Product.search(search_params)
  #   @products = @q
  #     .result
  #     .order(availability: :desc, code: :asc)
  #     .decorate
  #   if params[:export_csv]
  #     send_data @products.to_csv, filename: "#{Time.current.strftime('%Y%m%d')}.csv"
  #   else
  #     render :search
  #   end
  # end
  
  #2.2_B
  def search
  end
  
  # 一括変更
  # def new
  #   @form = Form::ProductCollection.new
  # end

  # 一括変更
  # def create
  #   @form = Form::ProductCollection.new(product_collection_params)
  #   if @form.save
  #     redirect_to new_product_path, notice: "#{@form.target_products.size}件の商品を登録しました。"
  #   else
  #     render :new
  #   end
  # end
  
  # def new
  #   @product = Form::Product.new
  # end

  # def edit
  #   @product = Form::Product.find(params[:id])
  # end

  # def create
  #   @product = Form::Product.new(product_params)
  #   if @product.save
  #     redirect_to products_path, notice: "商品 #{@product.name} を登録しました。"
  #   else
  #     render :new
  #   end
  # end

  # def update
  #   @product = Form::Product.find(params[:id])
  #   if @product.update_attributes(product_params)
  #     redirect_to products_path, notice: "商品 #{@product.name} を更新しました。"
  #   else
  #     render :edit
  #   end
  # end
  
  # 2.2_A
  # def export_csv
  #   @products = Product.all
  #   send_data @products.to_csv, filename: "#{Time.current.strftime('%Y%m%d')}.csv"
  # end
  
  # 2.2_B
  def export_csv
    byebug
    send_data @products.to_csv, filename: "#{Time.current.strftime('%Y%m%d')}.csv"
  end
  
  private
  
  def product_params
    params
      .require(:form_product)
      .permit(Form::Product::REGISTRABLE_ATTRIBUTES)
  end
  
  def search_params
    search_conditions = %i(
      code_cont name_cont name_kana_cont availability_true
      price_gteq price_lteq purchase_cost_gteq purchase_cost_lteq
    )
    params.require(:q).permit(search_conditions)
  end
  
  #2.2_B
  def set_products
    @q = Product.search(search_params)
    @products = @q
      .result
      .order(availability: :desc, code: :asc)
      .decorate
  end

  # def product_params
    # 1.4
    # params
    #   .require(:form_product)
    #   .permit(
    #     Form::Product::REGISTRABLE_ATTRIBUTES +
    #     [product_categories_attributes: Form::ProductCategory::REGISTRABLE_ATTRIBUTES]
    #   )
     
     #1.5  
    # params
    #   .require(:form_product)
    #   .permit(Form::Product::REGISTRABLE_ATTRIBUTES + Form::Product::REGISTRABLE_RELATIONS)
  # end

  # 一括変更
  # def product_collection_params
  #   params
  #     .require(:form_product_collection)
  #     .permit(products_attributes: Form::Product::REGISTRABLE_ATTRIBUTES)
  # end  
  
  #サーチフォーム
  # def search_params
  #   params
  #     .require(:search_product)
  #     .permit(Search::Product::ATTRIBUTES)
  # end
  
  # def search_params
  #   search_conditions = %i(
  #     code_cont name_cont name_kana_cont availability_true
  #     price_gteq price_lteq purchase_cost_gteq purchase_cost_lteq
  #   )
  #   params.require(:q).permit(search_conditions)
  # end
end
