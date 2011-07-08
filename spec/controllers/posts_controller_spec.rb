require 'spec_helper'

describe PostsController do

  # This should return the minimal set of attributes required to create a valid
  # Post. As you add validations to Post, be sure to
  # update the return value of this method accordingly.
  describe '#index' do
    context 'when not signed in' do
      it 'redirects to admin signin path' do
        get :index
        response.should redirect_to new_admin_session_path
      end  
    end  
    context 'when signed in as user' do
      it 'redirects to admin signin path' do
        sign_in Factory(:user)
        get :index
        response.should redirect_to new_admin_session_path
      end  
    end  
    context 'when signed in as admin' do
      it "assigns all posts as @posts" do
        sign_in Factory(:admin)        
        post = Factory(:post)
        get :index
         assigns(:posts).should eq([post]) # => Fails !!
        # actually, redirects to new_admin_session_path although admin is signed in !!
        # response.should_not redirect_to new_admin_session_path
      end
    end
  end
end
