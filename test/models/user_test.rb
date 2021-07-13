# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'ユーザを新規作成する' do
    new_user = User.new(username: 'hoge')
    assert new_user.save
  end

  test 'ユーザーを検索する' do
    user = User.find_by(username: 'foo')
    assert user.username == 'foo'
  end

  test 'ユーザーを削除する' do
    user = User.find_by(username: 'foo')
    assert user.destroy
  end
end
