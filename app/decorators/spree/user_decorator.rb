class Spree::UserDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  def link_to
    h.link_to object.email, h.edit_admin_user_path(object)
  end
  def dt_actions
    links = []
    links << h.link_to_edit(object, no_text: true)
    links << h.link_to_delete(object, no_text: true)
    
    # <%= link_to_edit user, no_text: true if can?(:edit, user) %>
    # <%= link_to_delete user, no_text: true if can?(:delete, user) %>
    h.safe_join(links, '')
  end
end
