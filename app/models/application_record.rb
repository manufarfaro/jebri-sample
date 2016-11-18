class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.human_enum_name(enum_name, enum_value)
    I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{enum_name.to_s.pluralize}.#{enum_value}")
  end

  def self.create_default_avatar_missing_path
    ActionController::Base.helpers.image_path('missing.png')
  end

  def self.options_for_sorted_by
    [
        ['Creación (Nuevos Primero)', 'created_at_desc'],
        ['Creación (Antiguos Primero)', 'created_at_asc'],
        ['Nombre (a-z)', 'name_asc'],
        ['Nombre (z-a)', 'name_desc'],
        ['Habilitado (Si-No)', 'enabled_asc'],
        ['Habilitado (No-Si)', 'enabled_desc']
    ]
  end

  def self.options_for_enabled
    [
        ['Si', 1],
        ['No', 0]
    ]
  end
end
