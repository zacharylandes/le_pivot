class Permission

  def initialize(user, controller, action)
    @user = user || User.new
    @controller = controller
    @action = action
  end

  def authorized?
    if user.platform_admin?
      return true if controller == "admin/dashboard" && action == "index"
      return true if controller == "admin/analytics" && action == "index"
      return true if controller == "admin/items" && action == "index"
      return true if controller == "store/items" && action.in?(%w(index new create edit update destroy))
      return true if controller == "store/orders" && action.in?(%w(index new create edit update destroy))
      return true if controller == "users" && action.in?(%w(update edit new create index show))
      return true if controller == "dashboard" && action.in?(%w(index))
      return true if controller == "stores" && action.in?(%w(index create new show))
      return true if controller == "main" && action == "index"
      return true if controller == "sessions" && action.in?(%w(new create destroy))
      return true if controller == "carts" && action.in?(%w(index create destroy update))
      return true if controller == "categories/categories" && action.in?(%w(show))
      return true if controller == "orders" && action.in?(%w(index show create update))
      return true if controller == "items" && action.in?(%w(index show))

    elsif user.store_admin?

      return true if controller == "stores/employees" && action == "update"
      return true if controller == "stores"  && action.in?(%w(edit show update))
      return true if controller == "admin/items" && action == "index"
      return true if controller == "store/items" && action.in?(%w(index new create edit update destroy))
      return true if controller == "store/orders" && action.in?(%w(index new create edit update destroy))
      return true if controller == "users" && action.in?(%w(update edit new create index show))
      return true if controller == "dashboard" && action.in?(%w(index))
      return true if controller == "stores" && action.in?(%w(index create new show edit))
      return true if controller == "main" && action == "index"
      return true if controller == "sessions" && action.in?(%w(new create destroy))
      return true if controller == "carts" && action.in?(%w(index create destroy update))
      return true if controller == "categories/categories" && action.in?(%w(show))
      return true if controller == "orders" && action.in?(%w(index show create update))
      return true if controller == "items" && action.in?(%w(index show))

    elsif user.store_manager?
      return true if controller == "stores/employees" && action == "update"

      return true if controller == "store/items" && action.in?(%w(index new create edit update destroy))
      return true if controller == "store/orders" && action.in?(%w(index new create edit update destroy))
      return true if controller == "main" && action == "index"
      return true if controller == "sessions" && action.in?(%w(new create destroy))
      return true if controller == "users" && action.in?(%w(new update edit create))
      return true if controller == "carts" && action.in?(%w(index create destroy update))
      return true if controller == "categories/categories" && action.in?(%w(show))
      return true if controller == "dashboard" && action.in?(%w(index))
      return true if controller == "stores" && action.in?(%w(index new create show edit))
      return true if controller == "items" && action.in?(%w(show))
      return true if controller == "orders" && action.in?(%w(index create show update))

    elsif user.registered_user?
      return true if controller == "main" && action == "index"
      return true if controller == "sessions" && action.in?(%w(new create destroy))
      return true if controller == "users" && action.in?(%w(new create))
      return true if controller == "carts" && action.in?(%w(index create destroy update))
      return true if controller == "categories/categories" && action.in?(%w(show))
      return true if controller == "stores" && action.in?(%w(index show))
      return true if controller == "items" && action.in?(%w(show))
      return true if controller == "sessions" && action.in?(%w(new create destroy))
      return true if controller == "users" && action.in?(%w(update new create destroy))
      return true if controller == "orders" && action.in?(%w(index show update create destroy))
      return true if controller == "dashboard" && action.in?(%w(index))
      return true if controller == "stores" && action.in?(%w(create new edit update destroy))
    end

  end

  private
    attr_reader :user, :controller, :action

    # def base_permissions
    #   return true if controller == "main" && action == "index"
    #   return true if controller == "sessions" && action.in?(%w(new create destroy))
    #   return true if controller == "users" && action.in?(%w(new create))
    #   return true if controller == "carts" && action.in?(%w(index create destroy update))
    #   return true if controller == "categories/categories" && action.in?(%w(show))
    #   return true if controller == "stores" && action.in?(%w(index show))
    #   return true if controller == "items" && action.in?(%w(show))
    # end

end