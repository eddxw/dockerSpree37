# frozen_string_literal: true

class UserDatatable < AjaxDatatablesRails::ActiveRecord
  def view_columns
    @view_columns ||= {
      id: { source: 'Spree::User.id' },
      complete_name: { source: 'Spree::User.complete_name', cond: :like, searchable: true, orderable: true },
      email: { source: 'Spree::User.email' },
      dt_actions: { searchable: false, orderable: false }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        complete_name: record.complete_name,
        email: record.email,
        DT_RowId: record.id,
        dt_actions: record.decorate.dt_actions # This will automagically set the id attribute on the corresponding <tr> in the datatable
      }
    end
  end

  def get_raw_records
    Spree::User.all
  end
end
