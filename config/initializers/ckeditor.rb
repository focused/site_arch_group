# Use this hook to configure ckeditor
if Object.const_defined?("Ckeditor")
  Ckeditor.setup do |config|
    # ==> ORM configuration
    # Load and configure the ORM. Supports :active_record (default), :mongo_mapper and
    # :mongoid (bson_ext recommended) by default. Other ORMs may be
    # available as additional gems.
    require "ckeditor/orm/active_record"

    # Allowed image file types for upload.
    # Set to nil or [] (empty array) for all file types
    config.image_file_types = %w(jpg jpeg png gif tiff)

    # Allowed attachment file types for upload.
    # Set to nil or [] (empty array) for all file types
    config.attachment_file_types = %w(doc docx xls xlsx ppt pptx odt ods pdf
      rar zip tar swf txt rtf)

    # Setup authorization to be run as a before filter
    # config.authorize_with :cancan
  end
end
