require 'test_helper'

class WatchTest < ActiveSupport::TestCase
  def setup
    Watch::Watch.destroy_all
    (1..5).each {|i| User.create(name: ::Faker::Name.name) }
    (1..5).each {|i| Firm.create(name: ::Faker::Company.name) }
  end

  test "truth" do
    assert_kind_of Module, Watch
  end

  test 'Basics' do
    assert { User.first.present? }
  end

  test 'Watches Save' do
    Watch::Watch.create(watcher: User.first, watchable: Firm.first)
    assert { User.first.watches.present? }
  end

  test 'Ensure unique Watcher/Watchable' do
    u = User.first
    f = Firm.last

    assert { u.present? }
    assert { f.present? }

    u.watch(f)
    u.watch(f)
    
    assert { u.watches.count == 1 }
  end

  test 'Watch multiple objects' do
    u = User.first
    f = Firm.first
    f2 = Firm.last

    assert { u.present? }
    assert { f != f2 }

    u.watch(f)
    u.watch(f2)
    
    assert { u.watches.count == 2 }
  end

  test 'Unwatch' do
    u = User.first
    f = Firm.last

    u.watch(f)
    assert { u.watches?(f) }

    u.unwatch(f)
    assert { u.watches?(f) == false }
  end

  test 'Watch is polymorphic' do
    u = User.first
    f = Firm.last

    u.watch(f)
    assert { u.watches?(f) }

    u.watch(u)
    assert { u.watches?(u) }
  end

  test 'Can see who watches an object' do
    u = User.first
    f = Firm.last

    u.watch(f)
    assert { u.watches?(f) }

    assert { f.watchers.collect(&:watcher).include?(u) }
  end

  test 'Performance is optimized for getting large number of followers' do
    
    (1..(1000-Firm.count)).each {|i| Firm.create(name: ::Faker::Company.name) }

    u = User.first
    Firm.find_each{|f| u.watch(f) }

    time = Benchmark.realtime do
      watched = u.watches.all.collect(&:watchable)
      puts "#{watched.count}\t#{watched.last}"
    end
    puts time
  end

end
