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


class adr_held_until_ack_pass_b2b_no_wait extends test_base;
  task test();
    pre_test();

    bfm.CYC <= 1;
    bfm.STB <= 1;
    bfm.ADR <= 'h1122_3344;
    bfm.ACK <= 1;
    @(bfm.cb);

    bfm.ADR <= 'hffff_0000;
    @(bfm.cb);

    `fail_if_sva_not_succeeded("ADR_HELD_UNTIL_ACK", "")
  endtask


  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  `uvm_component_utils(adr_held_until_ack_pass_b2b_no_wait)
endclass
