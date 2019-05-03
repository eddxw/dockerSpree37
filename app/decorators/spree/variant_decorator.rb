class Spree::VariantDecorator < ApplicationDecorator
  delegate_all

  def actions(order, variant)
    h.content_tag(:div, class: 'large ui compact icon buttons') do
      h.link_to(h.product_path(object.product.id), target: :_blank, class: 'ui blue basic button') do
        h.content_tag(:i, '', class: 'large icons') do
          h.content_tag(:i, '', class: 'white desktop icon')+
          h.content_tag(:i, '', class: 'top right corner white eye icon')
        end
      end +
        h.link_to(h.add_admin_pos_path(number: order.number, item: variant), method: :get, remote: true, class: 'ui green basic button') do
          h.content_tag(:i, '', class: 'large white cart plus icon')
        end
    end
  end

  def stock_actions
    edith_path = object.is_master? ? h.edit_admin_product_path(object.product.id) : h.edit_admin_product_variant_path(object.product.id, object.id)
    h.content_tag(:div, class: 'large ui compact icon buttons') do
      h.link_to(edith_path, target: :_blank, class: 'ui blue basic button') do
        h.content_tag(:i, '', class: 'large white edit icon')
      end +
      h.link_to(h.admin_product_images_path(object.product.id), target: :_blank, class: 'ui blue basic button') do
        h.content_tag(:i, '', class: 'large white images icon')
      end +
      h.link_to(h.product_path(object.product.id), target: :_blank, class: 'ui blue basic button') do
        h.content_tag(:i, '', class: 'large icons') do
          h.content_tag(:i, '', class: 'white desktop icon')+
          h.content_tag(:i, '', class: 'top right corner white eye icon')
        end
      end +
      h.link_to(h.stock_admin_product_path(object.product.id, variant: object.id), target: :_blank, class: 'ui blue basic button') do
        h.content_tag(:i, '', class: 'large white dolly icon')
      end +
        h.link_to(h.volume_prices_admin_product_variant_path(product_id: object.product.id, id: object.id), target: :_blank, class: 'ui blue basic button') do
          h.content_tag(:i, '', class: 'large icons') do
            h.content_tag(:i, '', class: 'white clipboard list icon')+
            h.content_tag(:i, '', class: 'top right corner white dollar sign icon')
          end
        end
    end
  end

  def image
    object.images.first ? h.mini_image(object) : h.mini_image(product)
    # h.image_tag(img)
  end
  def stock_image
    object.id
  end
  def name
    h.object.name.truncate(10)
  end
end
