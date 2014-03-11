require 'spec_helper'

describe Post do

  #lazy loaded variable. This only gets created if a test asks for it. 
  let(:valid_params) {{title: "New post!", content: "A great story"}}

  #creates an instance variable for each and every test in this suite.
  # before do
    # @valid_params = {title: "New post!", content: "A great story"}
  # end

  it "title should be automatically titleized before save" do
    post = Post.new(title: "new post", content: "A great story")
    post.save
    expect(post.title).to eq("New Post")
  end

  it "post should be unpublished by default" do
    post = Post.new(title: "new post", content: "A great story")
    expect(post.is_published).to be_false
  end

  # a slug is an automaticaly generated url-friendly
  # version of the title
  it "slug should be automatically generated" do
    post = Post.new(title: "New post!", content: "A great story")

    expect(post.slug).to be_nil
    post.save

    expect(post.slug).to eq "new-post"
  end
end
