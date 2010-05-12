module CuteDemos
  module Platform
    SOURCE_DIR = File.dirname(__FILE__)
    TOP_DIR = File.dirname(SOURCE_DIR)
    MEDIA_DIR = File.join(TOP_DIR,"media")
    IMAGES_DIR = File.join(MEDIA_DIR,"images")
    IMAGE_DIR = IMAGES_DIR # alias
  end
end