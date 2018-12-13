class Form::Product < Product
  include DatetimeIntegratable
  #REGISTRABLE_ATTRIBUTES = %i(code name name_kana price purchase_cost availability)
  has_many :product_categories, class_name: 'Form::ProductCategory'
  
  #1.5
  # REGISTRABLE_RELATIONS = [category_ids: []]

  # def selectable_categories
  #   Category.all
  # end
  
  #1.6
  REGISTRABLE_ATTRIBUTES = %i(
    name
    arrival_date
    # arrival_date(1i) arrival_date(2i) arrival_date(3i)
    # published_at(1i) published_at(2i) published_at(3i)
    # published_at(4i) published_at(5i)
    published_at_date published_at_hour published_at_minute
  )
  
  # DatetimeIntegratableで宣言した、 integrate_datetime_fields関数を利用
  # 下記のように宣言することで、モデル初期化時にpublished_atを
  # published_at_date, published_at_hour, published_at_minute に分解する
  #
  # モデル保存時に、date/hour/minute の3つの変数の値を
  # published_at に戻す
  integrate_datetime_fields :published_at

  validates :published_at_date, presence: true
  validates :published_at_hour, presence: true
  validates :published_at_minute, presence: true
end

