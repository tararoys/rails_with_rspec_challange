require 'spec_helper'

describe Post do
 
  let(:valid_params) {{title: "New post!", content: "A great story"}}


  it "title should be automatically titleized before save" do
    post = Post.new(valid_params.merge(title: 'new post'))
    post.save
    expect(post.title).to eq("New Post")
  end

  it "post should be unpublished by default" do
    post = Post.new(valid_params)
    expect(post.is_published).to be_false
  end

  # a slug is an automaticaly generated url-friendly
  # version of the title
  it "slug should be automatically generated" do
    post = Post.new(valid_params)

    expect(post.slug).to be_nil
    post.save

    expect(post.slug).to eq "new-post"
  end
end
