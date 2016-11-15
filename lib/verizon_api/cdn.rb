class VerizonApi::CDN < VerizonApi

  # def purge(media_type, path)
  #   object_url = File.join(@media_base_uri, path)
  #   self.class.put('/edge/purge', {:body => {'MediaType' => MEDIA_TYPES[media_type.to_sym], 'MediaPath' => object_url}.to_json})
  # end
  #
  # def load(media_type, path)
  #   object_url = File.join(@media_base_uri, path)
  #   self.class.put('/edge/load', {:body => {'MediaType' => MEDIA_TYPES[media_type.to_sym], 'MediaPath' => object_url}.to_json})
  # end
  #
  # def purge_status(id)
  #   self.class.get("/edge/purge/#{id}")
  # end

end
