require 'test_helper'

class ProjectFlowsTest < ActionDispatch::IntegrationTest
  test "browsing projects" do 
  	x = OpenStruct.new 	
  	(1..3).each do |n|
  		x.send("project#{n}=", FactoryGirl.create(:project, :title => "Project #{n}"))
  	end
  	visit "/projects"
  	assert_equal projects_path, current_path
  	assert page.has_content?('Listing projects')
  	assert page.has_content?('Project 1')
    assert page.has_content?('Project 2')
    assert page.has_content?('Project 3')
  end
end
