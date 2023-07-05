module ProductsHelper
  def category_selected?(query, category_id)
    return false unless query && query[:category_id_in]

    query[:category_id_in].first.include?(category_id.to_s)
  end

  def sort_option_list
    [
      ['Default', ''],
      ['Price low to high', 'price asc'],
      ['Price high to low', 'price desc'],
      ['Latest products', 'created_at desc']
    ]
  end
end
