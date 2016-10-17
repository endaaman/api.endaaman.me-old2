# == Schema Information
#
# Table name: memos
#
#  id         :integer          not null, primary key
#  slug       :string(255)      not null
#  title      :string(255)      not null
#  digest     :string(255)      default(""), not null
#  hidden     :boolean          default(FALSE), not null
#  draft      :boolean          default(FALSE), not null
#  image_url  :text(65535)      not null
#  content    :text(65535)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_memos_on_slug  (slug) UNIQUE
#


require "securerandom"

class Memo < ApplicationRecord
  before_save do
    if self.slug.nil? or self.slug.empty?
      self.slug = SecureRandom.hex 12
    end
    self
  end
end


