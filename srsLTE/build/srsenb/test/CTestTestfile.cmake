# CMake generated Testfile for 
# Source directory: /home/pnatu/Work/thesis/srsLTE/srsenb/test
# Build directory: /home/pnatu/Work/thesis/srsLTE/build/srsenb/test
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(enb_metrics_test "enb_metrics_test" "-o" "/home/pnatu/Work/thesis/srsLTE/build/srsenb/test/enb_metrics.csv")
set_tests_properties(enb_metrics_test PROPERTIES  _BACKTRACE_TRIPLES "/home/pnatu/Work/thesis/srsLTE/srsenb/test/CMakeLists.txt;28;add_test;/home/pnatu/Work/thesis/srsLTE/srsenb/test/CMakeLists.txt;0;")
subdirs("mac")
subdirs("phy")
subdirs("upper")
subdirs("rrc")
