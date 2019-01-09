module ApiHelper

  def create_users_hash
    @users_hash = {}
  end

  def api_headers
    {'Content-Type' => 'application/json', 'X-Redmine-API-Key' => 'f7a43e86465cd4ade4b49ee12ad396c01e1e332b'}
  end

  def create_user_via_api(user)
    payload =  {
        'user' => {
            'login' => user,
            'firstname' => user,
            'lastname' => user,
            'mail' => user + '@softserveinc.com',
            'password' => '1234qwer'
        }
    }.to_json
    @response = RestClient.post('http://10.128.232.50/users.json', payload, api_headers)
    user_id = JSON.parse(@response)["user"]["id"]
    @users_hash[user] = user_id
  end

  def check_project_in_database
    RestClient.get('http://10.128.232.50/projects/' + "a#{@time}.json", api_headers)
  end

  def check_user_in_database(name)
    RestClient.get('http://10.128.232.50/users/' + @users_hash[name].to_s + ".json", api_headers)
  end

  def check_ui_registered_user_in_database(name)
    response = RestClient.get('http://10.128.232.50/users.json', api_headers)
    all_users_parsed = JSON.parse(response)
    all_users_parsed["users"].each{
      |i| if i["login"] == name
            @users_hash[name] = i["id"]
          end
    }
    raise 'User was not found in database' if @users_hash.empty?
  end

  def users_cleaning_tool
    loop do
    all_users = RestClient.get('http://10.128.232.50/users.json', api_headers)
    all_users_parsed = JSON.parse(all_users)
      all_users_parsed["users"].each{
        |x| if x["id"] == 1
              next
            else
              RestClient.delete('http://10.128.232.50/users/' + x["id"].to_s + ".json", api_headers)
            end
      }
      break if all_users_parsed["total_count"] <= 25
    end
  end

  def projects_cleaning_tool
    loop do
      all_projects = RestClient.get('http://10.128.232.50/projects.json?limit=100', api_headers)
      all_projects_parsed = JSON.parse(all_projects)
      all_projects_parsed["projects"].each{|x| RestClient.delete('http://10.128.232.50/projects/' + x["id"].to_s + ".json", api_headers)}
      break if all_projects_parsed["total_count"] <= 100
    end
  end
end


