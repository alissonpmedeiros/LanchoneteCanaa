require 'test_helper'

class CashPaymentsControllerTest < ActionController::TestCase
  setup do
    @cash_payment = cash_payments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cash_payments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cash_payment" do
    assert_difference('CashPayment.count') do
      post :create, cash_payment: { description: @cash_payment.description, price: @cash_payment.price, salesman: @cash_payment.salesman }
    end

    assert_redirected_to cash_payment_path(assigns(:cash_payment))
  end

  test "should show cash_payment" do
    get :show, id: @cash_payment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cash_payment
    assert_response :success
  end

  test "should update cash_payment" do
    patch :update, id: @cash_payment, cash_payment: { description: @cash_payment.description, price: @cash_payment.price, salesman: @cash_payment.salesman }
    assert_redirected_to cash_payment_path(assigns(:cash_payment))
  end

  test "should destroy cash_payment" do
    assert_difference('CashPayment.count', -1) do
      delete :destroy, id: @cash_payment
    end

    assert_redirected_to cash_payments_path
  end
end
