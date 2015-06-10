# Watch

## Setup

1. Add the plugin to your gemfile and install the migrations:

```ruby
gem 'watch', git: 'grantiq/watch'
```

```bash
bundle
bundle exec rake watch:install:migrations
bundle exec rake db:migrate
```

2. Add an initializer to setup the default watcher object:

```ruby
Watch.configure do |configuration|
  configuration.watcher = -> (context) { current_user }
end
```

3. Add this snippet to `routes.rb`:

```ruby
  mount Watch::Engine, at: '/'
```

4. Add this snippet to `application_controller.rb`:

```ruby
helper Watch::Engine.helpers
```

5. For every watcher object include the following:

```ruby
class User < ActiveRecord::Base
  include Watch::Watcher
end
```

6. For every watchable object include the following:

```ruby
class Firm < ActiveRecord::Base
  include Watch::Watchable
end
```

7. Views can be modified to use the bundled react component:

```erb
<%= firm.name %>
<%= react_watch_widget(firm) %>
```
