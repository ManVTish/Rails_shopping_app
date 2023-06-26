ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

  permit_params :name, :description, :stock, :price, :category_id

  form do |f|
    f.inputs do
      f.input :name
      f.input :description, require: false
      f.input :stock
      f.input :price
      f.input :category_id, as: :select, collection: Category.all
      f.semantic_errors *f.object.errors.attribute_names
    end
    f.actions do
      f.submit 'Create a new Product', as: :button
    end
  end

  controller do
    def create
      attrs = params[:product]

      name = attrs[:name]
      desc = attrs[:description] || ""
      stock = attrs[:stock]
      price = attrs[:price]
      cat_id = attrs[:category_id]

      @product = Product.new(
        name: name,
        description: desc,
        stock: stock,
        price: price,
        category_id: cat_id
      )

      if @product.save
        redirect_to '/admin/products'
      else
        render :new
      end
    end
  end
end
