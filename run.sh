irun \
  sv/vgm_wb_master_sva_checker.sv \
  \
  -uvm \
  -define UVM_DEPRECATED_REPORTING \
  -incdir dependencies/svaunit/sv \
  dependencies/svaunit/sv/svaunit_pkg.sv \
  dependencies/svaunit/sv/svaunit_vpi_interface.sv \
  -dpi \
  -DIRUN \
  -cpost "dependencies/svaunit/sv/svaunit_vpi_api.cpp" -end \
  -access rwc \
  -abvcoveron \
  -abvrecordcoverall \
  -covoverwrite \
  -timescale 1ns/1ns \
  \
  -incdir unit \
  unit/wb_bfm.sv \
  unit/top.sv \
  \
  +UVM_TESTNAME=test_suite
