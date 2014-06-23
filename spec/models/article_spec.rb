require 'rails_helper'

describe Article do
  it { should belong_to :category }
  it { should have_many :media }
  it { should have_many :videos }
  it { should have_many :images }
end
