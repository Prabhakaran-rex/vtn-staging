module Paperclip
  class AvatarCropper < Thumbnail
    def initialize(file, options = {}, attachment = nil)
      super
      @current_geometry.width  = target.crop_w
      @current_geometry.height = target.crop_h
    end
    def target
      @attachment.instance
    end
    def transformation_command
      
      if target.cropping?
         resize_command = ["-resize", "\"550x550>\""]

      crop_command = [
        "-crop",
        "#{target.crop_w.to_i}x" \
          "#{target.crop_h.to_i}+" \
          "#{target.crop_x}+" \
          "#{target.crop_y}",
        "+repage"
      ]
      resize_command+ crop_command # + super
      else
        super
      end
    end
  end
end