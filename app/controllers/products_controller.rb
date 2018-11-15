class ProductsController < ApplicationController
  
  def new
    @form = Form::ProductCollection.new
  end

  def create
    @form = Form::ProductCollection.new(product_collection_params)
    if @form.save
      redirect_to :products, notice: "#{@form.target_products.size}件の商品を登録しました。"
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
end
