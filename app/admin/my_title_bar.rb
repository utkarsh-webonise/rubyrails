class MyTitleBar < ActiveAdmin::Component
  def build(title, action_items)
    super(:id => "title_bar")
    @title = title
    @action_items = action_items
    build_titlebar_left
    build_titlebar_right
  end

  private

  def build_titlebar_left
    div :id => "titlebar_left" do
      build_title_tag
    end
  end

  def build_titlebar_right
    div :id => "titlebar_right" do
      build_action_items
      render :partial => 'shared/form'
    end
  end

  def build_title_tag
    h2(@title, :id => 'page_title')
  end

  def build_action_items
    insert_tag(view_factory.action_items, @action_items) if @action_items.any?
  end

end