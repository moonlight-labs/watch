require "test_helper"

describe FirmsController do

  let(:firm) { firms :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:firms)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates firm" do
    assert_difference('Firm.count') do
      post :create, firm: { index: firm.index, show: firm.show }
    end

    assert_redirected_to firm_path(assigns(:firm))
  end

  it "shows firm" do
    get :show, id: firm
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: firm
    assert_response :success
  end

  it "updates firm" do
    put :update, id: firm, firm: { index: firm.index, show: firm.show }
    assert_redirected_to firm_path(assigns(:firm))
  end

  it "destroys firm" do
    assert_difference('Firm.count', -1) do
      delete :destroy, id: firm
    end

    assert_redirected_to firms_path
  end

end
