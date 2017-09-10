require 'spec_helper_acceptance'

describe 'pdk class' do
  context 'default parameters' do
    it 'must work idempotently with no errors' do
      pp = <<-EOS
      class { 'pdk': }
      EOS

      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes:  true)
    end
    it 'should generate a module' do
      on(hosts, 'pdk new module --skip-interview test')
      on(hosts, 'cd test; pdk validate')
    end
  end
end
