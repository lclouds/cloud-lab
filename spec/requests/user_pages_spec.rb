require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

#    it { should have_selector('h1',    text: user.first_name) }
#    it { should have_selector('title', text: user.first_name) }
  end
  
  describe "signup page" do
    before { visit signup_path }

#    it { should have_selector('h1',    text: 'Sign up') }
#    it { should have_selector('title', text: 'Sign up') }
  end
  
   describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "First_Name",   with: "chen"
        fill_in "Last_Name",    with: "shuchuan"
        fill_in "Email",        with: "394666278@qq.com"
        fill_in "Password",     with: "123456"
        fill_in "Confirmation", with: "123456"
      end
      #错误提示信息测试
      describe "after submission" do
        before { click_button submit }

#        it { should have_selector('title', text: 'Sign up') }
#        it { should have_content('error') }
      end
      #对 create 动作中保存用户操作的测试
      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by_email('user@example.com') }

#        it { should have_selector('title', text: user.first_name) }
#        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
#        it { should have_link('Sign out') }
      end

#      it "should create a user" do
#        expect { click_button submit }.to change(User, :count).by(1)
#      end
    end
  end
  
  
end