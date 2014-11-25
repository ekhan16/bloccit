require 'rails_helper'

describe User do

  include TestFactories
  before do
    @user = authenticated_user

  describe "#favorited(post)" do
    xit "returns 'nil' if the user has not favorited the post" do
      post = associated_post
    end

    xit "returns the appropriate favorite if it exists" do
    end
  end
end
