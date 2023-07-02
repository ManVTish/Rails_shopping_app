module ProductsHelper
  def category_selected?(query, category_id)
    return false unless query && query[:category_id_in]

    query[:category_id_in].first.include?(category_id.to_s)
  end
end