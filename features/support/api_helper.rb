module ApiHelper
  def api_headers
    {'Content-Type' => 'application/json', 'X-Redmine-API-Key' => 'f7a43e86465cd4ade4b49ee12ad396c01e1e332b'}
  end
  def create_user_via_api(user)
    payload =  {
        'user' => {
            'login' => user,
            'firstname' => 'James',
            'lastname' => 'Bond',
            'mail' => user + '@softserveinc.com',
            'password' => '1234qwer'
        }
    }.to_json
    RestClient.post('http://10.128.232.50/users.json', payload, api_headers)
  end
end
