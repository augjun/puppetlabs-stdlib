require 'spec_helper'

describe 'is_bool' do
  it { is_expected.not_to eq(nil) }
  # Checking for deprecation warning
  it 'should display a single deprecation' do
    scope.expects(:warning).with(includes('This method is deprecated'))
    is_expected.to run.with_params(true)
  end
  it { is_expected.to run.with_params().and_raise_error(Puppet::ParseError, /wrong number of arguments/i) }
  it { is_expected.to run.with_params(true, false).and_raise_error(Puppet::ParseError, /wrong number of arguments/i) }
  it { is_expected.to run.with_params(true).and_return(true) }
  it { is_expected.to run.with_params(false).and_return(true) }
  it { is_expected.to run.with_params([1]).and_return(false) }
  it { is_expected.to run.with_params([{}]).and_return(false) }
  it { is_expected.to run.with_params([[]]).and_return(false) }
  it { is_expected.to run.with_params([true]).and_return(false) }
  it { is_expected.to run.with_params('true').and_return(false) }
  it { is_expected.to run.with_params('false').and_return(false) }
end
