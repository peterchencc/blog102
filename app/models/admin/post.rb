class Admin::Post < Post
  default_scope { order('ranking, created_at DESC') }
end
