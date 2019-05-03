# frozen_string_literal: true

class Spree::StockItemDecorator < ApplicationDecorator
  delegate_all
  def image
    # img = object.variant.images.first.url(:mini)
    h.mini_image(object.variant, class: 'ui image')
    # h.image_tag(img)
  end

  # def name
  #   h.link_to object.product.name, h.stock_admin_product_path(object.product.id, variant: object.variant_id, stock_location: object.stock_location_id), target: :_blank
  # end

  # def link_to
  #   h.link_to object.email, h.edit_admin_user_path(object)
  # end

  def dt_actions
    edith_path = object.variant.is_master? ? h.edit_admin_product_path(object.product.id) : h.edit_admin_product_variant_path(object.product.id, object.variant_id)
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
      h.link_to(h.stock_admin_product_path(object.product.id, variant: object.variant_id, stock_location: object.stock_location_id), target: :_blank, class: 'ui blue basic button') do
        h.content_tag(:i, '', class: 'large white dolly icon')
      end +
        h.link_to(h.volume_prices_admin_product_variant_path(product_id: object.product.id, id: object.variant_id), target: :_blank, class: 'ui blue basic button') do
          h.content_tag(:i, '', class: 'large icons') do
            h.content_tag(:i, '', class: 'white clipboard list icon')+
            h.content_tag(:i, '', class: 'top right corner white dollar sign icon')
          end
        end
    end
  end
end
