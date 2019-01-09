class NewProject < SitePrism::Page
  set_url 'http://10.128.232.50/projects/new'
  element :name, '#project_name'
  element :description, '#project_description'
  element :identifier, '#project_identifier'
  element :create, :xpath, '//*[@id="new_project"]/input[3]'
end
