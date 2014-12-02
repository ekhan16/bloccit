 require 'rails_helper'
 
 describe VotesController do 
 
   include FactoryGirl
   include Devise::TestHelpers

   before do
    request.env["HTTP_REFERER"] = '/'
       @user = user
       @post = post
       sign_in @user
 
   describe '#up_vote' do
     it "adds an up-vote to the post" do
 
       expect {
         post( :up_vote, post_id: @post.id )
       }.to change{ @post.up_votes }.by 1
     end

  describe '#down_vote' do
    it "adds a down-vote to the post" do

      expect {
        post( :down_vote, post_id: @post.id )
      }.to change{ @post.down_votes }. by -1
    end
   end
 end