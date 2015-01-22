require 'spec_helper'

describe Comment do
  before(:each) do
    @attr = { name: "commenter name", content: "comment content" }
  end

  it "should create a new instance with valid attributes" do
    Comment.create!(@attr)
  end

  it "should require a commenter name" do
    no_commenter_name = Comment.new(@attr.merge(name: ""))
    no_commenter_name.should_not be_valid
  end

  it "should require comment content" do
    no_comment_content = Comment.new(@attr.merge(content: ""))
    no_comment_content.should_not be_valid
  end

  it "should reject commenter name that is too long" do
    long_name = "a" * 101
    long_commenter_name = Comment.new(@attr.merge(name: long_name))
    long_commenter_name.should_not be_valid
  end

  it "should reject commenter name that is too short" do
    short_name = "a"
    short_commenter_name = Comment.new(@attr.merge(name: short_name))
    short_commenter_name.should_not be_valid
  end

end
