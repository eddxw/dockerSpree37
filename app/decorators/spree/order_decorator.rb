# frozen_string_literal: true

class Spree::OrderDecorator < ApplicationDecorator
  delegate_all

  # def link_to
  #   h.link_to object.email, h.edit_admin_user_path(object)
  # end
  STATE = { 'paid' => 'green', 'balance_due' => 'yellow' }.freeze

  def payment_state
    h.content_tag(:div, class: "ui #{STATE[object.payment_state]} label") do
      # object.payment_state
      Spree.t("payment_states.#{object.payment_state.downcase}")
    end
  end

  def created_at
    l(object.created_at, format: '%a %d de %B de %Y %I:%M %p')
  end

  def email
    h.link_to object.email, h.edit_admin_user_path(object.user)
  end

  def dt_actions
    h.content_tag(:div, class: 'ui compact icon buttons') do
      h.link_to(h.admin_pos_show_order_path(number: object.number), class: 'ui blue basic button') do
        h.content_tag(:i, '', class: 'large icons') do
          h.content_tag(:i, '', class: 'white calculator icon') +
            h.content_tag(:i, '', class: 'top right corner white dollar sign icon')
        end
      end +
        h.link_to("/admin/invoice/#{object.number}/receipt", target: '_blank', class: 'ui blue basic button') do
          h.content_tag(:i, '', class: 'large icons') do
            h.content_tag(:i, '', class: 'white print icon') +
              h.content_tag(:i, '', class: 'top right corner white dollar sign icon')
          end
        end
    end
  end
end
