RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
  config.model Page do
    edit do
      include_all_fields
      # For RailsAdmin >= 0.5.0
      field :description, :ck_editor do
        config_js ActionController::Base.helpers.asset_path('ckeditor/config.js')
      end
      # For RailsAdmin < 0.5.0
      # field :description do
      #   ckeditor true
      # end
    end
  end
  config.model Product do
    edit do
      include_all_fields
      # For RailsAdmin >= 0.5.0
      field :description, :ck_editor do
        config_js ActionController::Base.helpers.asset_path('ckeditor/config.js')
      end
      # For RailsAdmin < 0.5.0
      # field :description do
      #   ckeditor true
      # end
    end
  end
  config.model Image do
    edit do
      # For RailsAdmin >= 0.5.0
      field :title
      field :image
    end
  end
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)
end
