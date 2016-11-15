class VerizonApi::Waf < VerizonApi::Api

  def _instance_details(id)
    response = self.class.get("/waf/config/instances/#{id}")
    fail("Unable to fetch instance id #{id}: 'HTTP Code #{response.code}: #{response.body}'") unless response.code == 200
    parsed = JSON.parse(response.body)
  end

  def _profile_details(id)
    response = self.class.get("/waf/config/profiles/#{id}")
    fail("Unable to fetch profile id #{id}: 'HTTP Code #{response.code}: #{response.body}'") unless response.code == 200
    parsed = JSON.parse(response.body)
  end

  def instances
    unless @instances
      response = self.class.get('/waf/config/instances')
      fail("Unable to fetch instances: 'HTTP Code #{response.code}: #{response.body}'") unless response.code == 200
      parsed = JSON.parse(response.body)
      @instances = {}
      parsed.each do |instance|
        @instances[instance['name']] = _instance_details(instance['id'])
      end
    end
    @instances
  end

  def profiles
    unless @profiles
      response = self.class.get('/waf/config/profiles')
      fail("Unable to fetch profiles: 'HTTP Code #{response.code}: #{response.body}'") unless response.code == 200
      parsed = JSON.parse(response.body)
      @profiles = {}
      parsed.each do |profile|
        @profiles[profile['name']] = _profile_details(profile['id'])
      end
    end
    @profiles
  end

  def add_instance(instance)
    # This method creates a new instance.  For documentation on what instance should contain, see
    # https://my.edgecast.com/uploads/ubers/1/docs/en-US/webhelp/b/RESTAPIHelpCenter/default.htm#Media_Management/WAF/Add-Instance.htm
    response = self.class.post("/waf/config/instances", body: instance.to_json)
    fail("Unable to create a new instance: 'HTTP Code #{response.code}: #{response.body}'") unless response.code == 200
  end

  def delete_instance(instance)
    # This method deletes an existing instance.  For documentation on what instance should contain, see
    # https://my.edgecast.com/uploads/ubers/1/docs/en-US/webhelp/b/RESTAPIHelpCenter/default.htm#Media_Management/WAF/Delete-Instance.htm
    response = self.class.delete("/waf/config/instances/#{instance['id']}")
    fail("Unable to delete instance id #{instance['id']}: 'HTTP Code #{response.code}: #{response.body}'") unless response.code == 200
  end

  def update_instance(instance)
    # This method updates an existing instance.  For documentation on what instance should contain, see
    # https://my.edgecast.com/uploads/ubers/1/docs/en-US/webhelp/b/RESTAPIHelpCenter/default.htm#Media_Management/WAF/Update-Instance.htm
    id = instance['id']
    response = self.class.put("/waf/config/instances/#{id}", body: instance.to_json)
    fail("Unable to update instance id #{id}: 'HTTP Code #{response.code}: #{response.body}'") unless response.code == 200
  end

  def add_profile(profile)
    # This method creates a new profile.  For documentation on what profile should contain, see
    # https://my.edgecast.com/uploads/ubers/1/docs/en-US/webhelp/b/RESTAPIHelpCenter/default.htm#Media_Management/WAF/Add-Profile.htm
    response = self.class.post("/waf/config/profiles", body: profile.to_json)
    fail("Unable to create a new profile: 'HTTP Code #{response.code}: #{response.body}'") unless response.code == 200
  end

  def delete_profile(profile)
    # This method deletes an existing profile.  For documentation on what profile should contain, see
    # https://my.edgecast.com/uploads/ubers/1/docs/en-US/webhelp/b/RESTAPIHelpCenter/default.htm#Media_Management/WAF/Delete-Profile.htm
    response = self.class.delete("/waf/config/profiles/#{profile['id']}")
    fail("Unable to delete profile id #{profile['id']}: 'HTTP Code #{response.code}: #{response.body}'") unless response.code == 200
  end

  def update_profile(profile)
    # This method updates an existing profile.  For documentation on what profile should contain, see
    # https://my.edgecast.com/uploads/ubers/1/docs/en-US/webhelp/b/RESTAPIHelpCenter/default.htm#Media_Management/WAF/Update-Profile.htm
    id = profile['id']
    response = self.class.put("/waf/config/profiles/#{id}", body: profile.to_json)
    fail("Unable to update profile id #{id}: 'HTTP Code #{response.code}: #{response.body}'") unless response.code == 200
  end
end
