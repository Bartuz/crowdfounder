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
    click_link 'Project 1'
    assert_equal project_path(project_1), current_path
    assert find('h1:first').has_content? project1.title
  end

  test "navigation" do 
    
    visit "/"

    assert_equal root_path, current_path
    assert_equal "Home", find('.navbar ul li.active a').text
    
    find('.navbar ul').click_link('Projects')
    assert_equal projects_path, projects_path
    assert_equal "Projects", find('.navbar ul li.active a').text    

  end
end
