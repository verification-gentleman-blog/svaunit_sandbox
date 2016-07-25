// Copyright 2016 Tudor Timisescu (verificationgentleman.com)
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


class adr_held_until_ack_pass extends test_base;
  task test();
    pre_test();

    bfm.CYC <= 1;
    bfm.STB <= 1;
    bfm.ADR <= 'h1122_3344;
    @(bfm.cb);

    bfm.ACK <= 1;
    @(bfm.cb);

    #1;
    `pass_if_sva_succeeded("ADR_HELD_UNTIL_ACK", "")
  endtask


  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  `uvm_component_utils(adr_held_until_ack_pass)
endclass
