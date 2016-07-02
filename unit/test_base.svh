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


class test_base extends svaunit_test;
  virtual wb_bfm bfm;


  function void build_phase(input uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db #(virtual wb_bfm)::get(null, "*", "bfm", bfm))
      `uvm_fatal("BFMERR", "BFM wasn't passed");
  endfunction


  task pre_test();
    vpiw.enable_assertion("ADR_HELD_UNTIL_ACK");

    bfm.RST = 0;
    bfm.STB = 0;
    bfm.ADR = 0;
    bfm.ACK = 0;

    @(bfm.cb);
  endtask


  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
endclass
