require 'spec_helper'

describe Hotel do
  it { should have_many(:rooms)}
  it { should have_many(:discounts) }
  it { should have_many(:prices) }
end
