class ProductsController < ApplicationController
  
  #サーチフォーム
  def index
    @product = Search::Product.new
  end

  def search
    @product = Search::Product.new(search_params)
    @products = @product
      .matches
      .order(availability: :desc, code: :asc)
      .decorate
  end
  
  #一括変更
  def new
    @form = Form::ProductCollection.new
  end

  def create
    @form = Form::ProductCollection.new(product_collection_params)
    if @form.save
      redirect_to new_product_path, notice: "#{@form.target_products.size}件の商品を登録しました。"
    else
      render :new
    end
  end

  private

  def product_collection_params
    params
      .require(:form_product_collection)
      .permit(products_attributes: Form::Product::REGISTRABLE_ATTRIBUTES)
  end  
  
  def search_params
    params
      .require(:search_product)
      .permit(Search::Product::ATTRIBUTES)
  end
end
