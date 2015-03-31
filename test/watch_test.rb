require 'test_helper'

require 'json-bloomfilter'

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

  # test 'Performance is optimized for getting large number of followers' do
    
  #   (1..(1000-Firm.count)).each {|i| Firm.create(name: ::Faker::Company.name) }

  #   u = User.first
  #   Firm.find_each{|f| u.watch(f) }

  #   time = Benchmark.realtime do
  #     watched = u.watches.all.collect(&:watchable)
  #     puts "#{watched.count}\t#{watched.last}"
  #   end
  #   puts time
  # end

  test 'Simple bloomfilter' do
    filter = JsonBloomfilter.build 10000, 0.01
  end
  
  test 'Check watch status of random list of objects quickly' do
    users_count = 10000
    firms_count = 10000
    check_count = 100

    User.transaction do
      (1..(firms_count-Firm.count)).each {|i| Firm.create(name: ::Faker::Company.name) }
      (1..(users_count-User.count)).each {|i| Firm.create(name: ::Faker::Name.name) }
    end

    u = User.first

    firms = Firm.order('random()').limit(check_count*10)
    firms.each { |f| u.watch(f) }

    firms = Firm.order('random()').limit(check_count)
    
    # make sure the firm objects are actually loaded
    t = firms.collect(&:to_s)

    time = Benchmark.realtime do
      firms.collect do |f| 
        u.watches?(f) 
      end 
    end
    puts "#{time}"


    filter = JsonBloomfilter.build 10000, 0.01
    filter.add u.watches.pluck(:watchable_type,:watchable_id)
    
    true_val = u.watches.limit(1).pluck(:watchable_type, :watchable_id)
    false_val = ["Firm", 12000]

    assert { filter.test true_val }
    assert { filter.test(false_val)  == false}

    time = Benchmark.realtime do
      firms.collect do |f| 
        filter.test(["Firm", f.id]) 
      end 
    end
    puts "#{time}"

  end

end
