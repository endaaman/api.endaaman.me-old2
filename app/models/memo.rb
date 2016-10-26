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
#  hex        :string(255)      not null
#
# Indexes
#
#  index_memos_on_slug  (slug) UNIQUE
#

class Memo < ApplicationRecord
  validates :slug, presence: true, uniqueness: true, format: {with: /[a-z0-9_-]{1,}/}
  validates :hex, presence: true, allow_blank: false
  validates :title, presence: true, allow_blank: false
  validates :digest, presence: true, allow_blank: true
  validates :hidden, inclusion: {in: [true, false]}
  validates :draft, inclusion: {in: [true, false]}
  validates :image_url, presence: true, allow_blank: true
  validates :content, presence: true, allow_blank: false

  before_validation do
    if self.hex.nil? or self.hex.empty?
      self.hex = SecureRandom.hex 12
    end
    if self.slug.nil? or self.slug.empty?
      self.slug = self.hex
    end
    self
  end
end


