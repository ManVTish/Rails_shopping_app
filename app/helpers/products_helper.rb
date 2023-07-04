module ProductsHelper
  def category_selected?(query, category_id)
    return false unless query && query[:category_id_in]

    query[:category_id_in].first.include?(category_id.to_s)
  end

  def sort_by_selected?
    options_for_select(
      [
        [t('Default'), ''],
        [t('Price low to high'), 'price asc'],
        [t('Price high to low'), 'price desc'],
        [t('Latest products'), 'created_at desc']
      ],
      params.dig(:query, :s)
    )
  end
end
