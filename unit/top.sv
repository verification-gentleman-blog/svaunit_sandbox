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


module top;
  `SVAUNIT_UTILS

  `include "test_base.svh"

  `include "tests/adr_held_until_ack_fail.svh"
  `include "tests/adr_held_until_ack_pass.svh"
  `include "tests/adr_held_until_ack_pass_b2b_no_wait.svh"

  `include "test_suite.svh"


  wb_bfm bfm();
  vgm_wb_master_sva_checker intf(
    bfm.CLK,
    bfm.RST,
    bfm.CYC,
    bfm.STB,
    bfm.ADR,
    bfm.ACK
  );


  initial begin
    uvm_config_db #(virtual wb_bfm)::set(null, "*", "bfm", bfm);
    run_test();
  end
endmodule
