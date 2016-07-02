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


interface vgm_wb_master_sva_checker(
  input bit CLK_I,
  input bit RST_I,
  input bit CYC_O,
  input bit STB_O,
  input bit[31:0] ADR_O,
  input bit ACK_I
);
  default clocking cb @(posedge CLK_I);
  endclocking

  default disable iff RST_I;


  ADR_HELD_UNTIL_ACK : assert property (
    0
  );
endinterface
