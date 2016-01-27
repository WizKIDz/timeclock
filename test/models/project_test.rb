require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  setup do
    @project = projects(:one)
  end

  # Check if validations are beeing ran on every instance
  test "is not a valid project" do
  	project = Project.new
  	assert_not project.save, "Saved without validating some properties" 
  end
  # Check if validations are beeing ran on every instance
  test "is a valid project" do
  	assert @project.save, "Unable to save valid project" 
  end
end
