require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test 'rejects duplicate names' do
    me_too = Person.new name: 'é'
    assert_raise(ActiveRecord::RecordNotUnique) do
      me_too.save!
    end
  end

  test 'rejects invalid fields' do
    me_too = Person.new name: 'abc'
    me_too.attributes[:full_name] = 'é'
    assert_raise(ActiveRecord::StatementInvalid) do
      me_too.save!
    end
  end
end
