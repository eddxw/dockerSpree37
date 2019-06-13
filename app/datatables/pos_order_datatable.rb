# frozen_string_literal: true

class PosOrderDatatable < AjaxDatatablesRails::ActiveRecord
  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      date: { source: 'Spree::Order.created_at' },
      number: { source: 'Spree::Order.number' },
      payment_state: { source: 'Spree::Order.payment_state' },
      email: { source: 'Spree::Order.email' },
      # costo: {source: 'Spree::Order.total'},
      total: { source: 'Spree::Order.total' },
      dt_actions: { searchable: false, orderable: false }
    }
  end

  def data
    records.map do |record|
      {
        date: record.decorate.created_at,
        number: record.number,
        payment_state: record.decorate.payment_state,
        email: record.decorate.email,
        venta: record.total,
        # costo: record.line_items.sum('cost_price * quantity'),
        # ganancia: record.total - record.line_items.sum('cost_price * quantity'),
        dt_actions: record.decorate.dt_actions
      }
    end
  end

  def user
    @user ||= options[:user]
  end

  def get_raw_records
    user.sales
    # Spree::Order.all
  end
end
