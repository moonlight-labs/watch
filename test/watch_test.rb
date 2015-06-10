require 'test_helper'

class WatchTest < ActiveSupport::TestCase

  test "'watch!' adds a watchable to a watchers watches" do
    user = User.create(name: "Peter")
    firm = Firm.create(name: "Apple")
    Watch::Watch.watch!(user, firm)

    assert_not_empty user.watches
  end

  test "'unwatch!' removes a watchable to a watchers watches" do
    user = User.create(name: "Peter")
    firm = Firm.create(name: "Apple")
    Watch::Watch.create(watcher: user, watchable: firm)
    
    Watch::Watch.unwatch!(user, firm)

    assert_empty user.watches
  end

  test "'watch!' allows for duplicate calls without duplicate results" do
    user = User.create(name: "Peter")
    firm = Firm.create(name: "Apple")
    
    5.times { user.watch!(firm) }
    
    assert_equal user.watches.count, 1
  end

  test "'unwatch!' allows for duplicate calls without duplicate results" do
    user = User.create(name: "Peter")
    firm = Firm.create(name: "Apple")
    Watch::Watch.create(watcher: user, watchable: firm)
    
    5.times { user.unwatch!(firm) }
    
    assert_equal user.watches.count, 0
  end

  test "'watching?' is 'true' if watching a watchable" do
    user = User.create(name: "Peter")
    firm = Firm.create(name: "Apple")
    Watch::Watch.create(watcher: user, watchable: firm)

    assert user.watching?(firm) 
  end

  test "'watching?' is 'false' if watching a watchable" do
    user = User.create(name: "Peter")
    firm = Firm.create(name: "Apple")

    assert !user.watching?(firm)
  end

end
