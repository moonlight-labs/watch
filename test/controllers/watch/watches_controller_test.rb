require 'test_helper'

module Watch
  class WatchesControllerTest < ActionController::TestCase

    test "gets 'index'" do
      User.create(name: "Peter")

      # get :index, format: :json
      # assert_response :success
    end

    test "posts 'create'" do
      user = User.create(name: "Peter")
      firm = Firm.create(name: "Apple")
      
      # assert_difference('::Watch::Watch.count') do
      #   post :create, type: 'Firm', id: firm.id, format: :json
      # end
      #
      # assert_response :success
    end

    test "deletes 'destroy'" do
      user = User.create(name: "Peter")
      firm = Firm.create(name: "Apple")
      watch = ::Watch::Watch.create(watcher: user, watchable: firm)
      
      # assert_difference('::Watch::Watch.count') do
      #   delete :destroy, type: 'Firm', id: firm.id, format: :json
      # end
      #
      # assert_response :success
    end

  end
end
