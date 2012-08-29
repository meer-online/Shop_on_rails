ActiveAdmin::Dashboards.build do
  
  section "Recent Products" do
    table_for Item.order("created_at desc").limit(5) do
      column "Name", :title do |item|
        link_to item.title, [:admin, item]
      end
      column :price
      column "Released at", :created_at
    end
    strong { link_to "View All Products", admin_items_path}
  end

  # section "Recent Categories" do
  #   table_for Category.order("created_at desc").limit(5) do
  #     column "Name", :name do |category|
  #       link_to category.name, [:admin, category]
  #     end
  #     column :description
  #     column "Created On", :created_at
  #   end
  #   strong { link_to "View All Categories", admin_categories_path}
  # end

  section "Recent Users" do
    table_for User.order("created_at desc").limit(5) do
      column "Email", :email do |user|
        link_to user.email, [:admin, user]
      end
      column "Registered On", :created_at
    end
    strong { link_to "View All Users", admin_users_path}
  end

  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.
  
  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  #   section "Recent Posts" do
  #     ul do
  #       Post.recent(5).collect do |post|
  #         li link_to(post.title, admin_post_path(post))
  #       end
  #     end
  #   end
  
  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end
  
  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.
  
  # == Conditionally Display
  # Provide a method name or Proc object to conditionally render a section at run time.
  #
  # section "Membership Summary", :if => :memberships_enabled?
  # section "Membership Summary", :if => Proc.new { current_admin_user.account.memberships.any? }

end
