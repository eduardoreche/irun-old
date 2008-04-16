module ProductsHelper
  
  def render_product_image(product)
    if product.image != nil
      image_tag "/images/products/#{product.image}", :id => "user_photo"
    end
  end
  
end
