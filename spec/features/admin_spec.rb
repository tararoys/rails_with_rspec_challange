require 'spec_helper'

feature 'Admin panel' do
  context "on admin homepage" do
    it "can see a list of recent posts" do
      Post.create(title: "Integration Tests Rock", content: "A great story")
      visit admin_posts_url 
      expect(page).to have_content "Integration Tests Rock" 
    end


    it "can edit a post by clicking the edit link next to a post" do 
      post = Post.create(title: "Integration Tests Rock", content: "A great story")
      
      visit admin_posts_url
      click_link "Edit"
      # save_and_open_page  #wonderful method
      expect(current_url).to eq(edit_admin_post_url(post))

      fill_in 'post_title', with: "Hello World!"
      click_button "Save"
      expect(post.reload.title).to eq('Hello World!')
    end

    it "can delete a post by clicking the delete link next to a post" do 
      post = Post.create(title: "Integration Tests Rock", content: "A great story")
      visit admin_posts_url
      save_and_open_page
      click_link "Delete"
      expect(page).to_not have_content "Integration Tests Rock"
    end

    
    it "can create a new post and view it" do
       visit new_admin_post_url

       expect {
         fill_in 'post_title',   with: "Hello world!"
         fill_in 'post_content', with: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat."
         page.check('post_is_published')
         click_button "Save"
       }.to change(Post, :count).by(1)

       expect(page).to have_content "Published: true"
       expect(page).to have_content "Post was successfully saved."
     end
  end

  context "editing post" do
    it "can mark an existing post as unpublished" do
      pending # remove this line when you're working on implementing this test

      expect(page).to have_content "Published: false"
    end
  end

  context "on post show page" do
    it "can visit a post show page by clicking the title"

    it "can see an edit link that takes you to the edit post path"

    it "can go to the admin homepage by clicking the Admin welcome page link"
  end
end
