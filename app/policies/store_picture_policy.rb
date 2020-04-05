class StorePicturePolicy < ApplicationPolicy

  def create?
    record.store.merchant == user
  end
end
