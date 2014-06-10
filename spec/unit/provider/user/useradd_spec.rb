#
# Author:: Adam Jacob (<adam@opscode.com>)
# Author:: Daniel DeLeo (<dan@opscode.com>)
# Copyright:: Copyright (c) 2008, 2010 Opscode, Inc.
#
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'spec_helper'

describe Chef::Provider::User::Useradd do

  subject(:provider) do
    p = described_class.new(@new_resource, @run_context)
    p.current_resource = @current_resource
    p
  end

  supported_useradd_options = {
    'comment' => "-c",
    'gid' => "-g",
    'uid' => "-u",
    'shell' => "-s",
    'password' => "-p"
  }

  include_examples "a useradd-based user provider", supported_useradd_options

  describe "manage_user" do
    it "should not run the command if universal_options is an empty array" do
      provider.stub!(:universal_options).and_return([])
      expect(provider.manage_user).not_to receive(:compile_command)
    end
  end
end
