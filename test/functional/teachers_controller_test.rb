require 'test_helper'

class TeachersControllerTest < ActionController::TestCase
  setup do
    @teacher = teachers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teachers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teacher" do
    assert_difference('Teacher.count') do
      post :create, teacher: { address: @teacher.address, alias_name: @teacher.alias_name, comment: @teacher.comment, deleted: @teacher.deleted, email: @teacher.email, first_name: @teacher.first_name, image_url: @teacher.image_url, last_name: @teacher.last_name, mobile: @teacher.mobile, position: @teacher.position, postcode: @teacher.postcode, pwd: @teacher.pwd, regist_name: @teacher.regist_name, resume: @teacher.resume, telephone: @teacher.telephone, title: @teacher.title, valid_certificate: @teacher.valid_certificate, valid_certificate_no: @teacher.valid_certificate_no }
    end

    assert_redirected_to teacher_path(assigns(:teacher))
  end

  test "should show teacher" do
    get :show, id: @teacher
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teacher
    assert_response :success
  end

  test "should update teacher" do
    put :update, id: @teacher, teacher: { address: @teacher.address, alias_name: @teacher.alias_name, comment: @teacher.comment, deleted: @teacher.deleted, email: @teacher.email, first_name: @teacher.first_name, image_url: @teacher.image_url, last_name: @teacher.last_name, mobile: @teacher.mobile, position: @teacher.position, postcode: @teacher.postcode, pwd: @teacher.pwd, regist_name: @teacher.regist_name, resume: @teacher.resume, telephone: @teacher.telephone, title: @teacher.title, valid_certificate: @teacher.valid_certificate, valid_certificate_no: @teacher.valid_certificate_no }
    assert_redirected_to teacher_path(assigns(:teacher))
  end

  test "should destroy teacher" do
    assert_difference('Teacher.count', -1) do
      delete :destroy, id: @teacher
    end

    assert_redirected_to teachers_path
  end
end
