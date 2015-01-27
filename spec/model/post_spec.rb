require 'spec_helper'

describe Post do
  before(:each) do
    @attr = { title: "post title", content: "post content"}
  end

  it "should create a new instance with valid attributes" do
    Post.create!(@attr)
  end

  it "should require a post title" do
    no_post_title = Post.new(@attr.merge(title: ""))
    no_post_title.should_not be_valid
  end

  it "should require post content" do
    no_post_content = Post.new(@attr.merge(content: ""))
    no_post_content.should_not be_valid
  end

  it "should reject title that is too long" do
    long_title = "a" * 256
    long_title_post = Post.new(@attr.merge(title: long_title))
    long_title_post.should_not be_valid
  end

  it "should reject title that is too short" do
    short_title = "a"
    short_title_post = Post.new(@attr.merge(title: short_title))
    short_title_post.should_not be_valid
  end

  it "should reject duplicate title" do
    Post.create!(@attr)
    duplicate_post = Post.new(@attr)
    duplicate_post.should_not be_valid
  end

  it "should have the right posts in the right order" do
    @post1 = Post.create!(@attr, created_at: 1.day.ago)
    @post2 = Post.create!(@attr.merge(title: "something"), created_at: 1.hour.ago)

    Post.all.should == [@post2, @post1]
  end

end
