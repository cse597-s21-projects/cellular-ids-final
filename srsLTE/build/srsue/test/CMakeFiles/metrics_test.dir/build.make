# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/pnatu/.local/bin/cmake

# The command to remove a file.
RM = /home/pnatu/.local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/pnatu/Work/thesis/srsLTE

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pnatu/Work/thesis/srsLTE/build

# Include any dependencies generated for this target.
include srsue/test/CMakeFiles/metrics_test.dir/depend.make

# Include the progress variables for this target.
include srsue/test/CMakeFiles/metrics_test.dir/progress.make

# Include the compile flags for this target's objects.
include srsue/test/CMakeFiles/metrics_test.dir/flags.make

srsue/test/CMakeFiles/metrics_test.dir/metrics_test.cc.o: srsue/test/CMakeFiles/metrics_test.dir/flags.make
srsue/test/CMakeFiles/metrics_test.dir/metrics_test.cc.o: ../srsue/test/metrics_test.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pnatu/Work/thesis/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object srsue/test/CMakeFiles/metrics_test.dir/metrics_test.cc.o"
	cd /home/pnatu/Work/thesis/srsLTE/build/srsue/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/metrics_test.dir/metrics_test.cc.o -c /home/pnatu/Work/thesis/srsLTE/srsue/test/metrics_test.cc

srsue/test/CMakeFiles/metrics_test.dir/metrics_test.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/metrics_test.dir/metrics_test.cc.i"
	cd /home/pnatu/Work/thesis/srsLTE/build/srsue/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pnatu/Work/thesis/srsLTE/srsue/test/metrics_test.cc > CMakeFiles/metrics_test.dir/metrics_test.cc.i

srsue/test/CMakeFiles/metrics_test.dir/metrics_test.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/metrics_test.dir/metrics_test.cc.s"
	cd /home/pnatu/Work/thesis/srsLTE/build/srsue/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pnatu/Work/thesis/srsLTE/srsue/test/metrics_test.cc -o CMakeFiles/metrics_test.dir/metrics_test.cc.s

srsue/test/CMakeFiles/metrics_test.dir/__/src/metrics_stdout.cc.o: srsue/test/CMakeFiles/metrics_test.dir/flags.make
srsue/test/CMakeFiles/metrics_test.dir/__/src/metrics_stdout.cc.o: ../srsue/src/metrics_stdout.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pnatu/Work/thesis/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object srsue/test/CMakeFiles/metrics_test.dir/__/src/metrics_stdout.cc.o"
	cd /home/pnatu/Work/thesis/srsLTE/build/srsue/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/metrics_test.dir/__/src/metrics_stdout.cc.o -c /home/pnatu/Work/thesis/srsLTE/srsue/src/metrics_stdout.cc

srsue/test/CMakeFiles/metrics_test.dir/__/src/metrics_stdout.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/metrics_test.dir/__/src/metrics_stdout.cc.i"
	cd /home/pnatu/Work/thesis/srsLTE/build/srsue/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pnatu/Work/thesis/srsLTE/srsue/src/metrics_stdout.cc > CMakeFiles/metrics_test.dir/__/src/metrics_stdout.cc.i

srsue/test/CMakeFiles/metrics_test.dir/__/src/metrics_stdout.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/metrics_test.dir/__/src/metrics_stdout.cc.s"
	cd /home/pnatu/Work/thesis/srsLTE/build/srsue/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pnatu/Work/thesis/srsLTE/srsue/src/metrics_stdout.cc -o CMakeFiles/metrics_test.dir/__/src/metrics_stdout.cc.s

srsue/test/CMakeFiles/metrics_test.dir/__/src/metrics_csv.cc.o: srsue/test/CMakeFiles/metrics_test.dir/flags.make
srsue/test/CMakeFiles/metrics_test.dir/__/src/metrics_csv.cc.o: ../srsue/src/metrics_csv.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pnatu/Work/thesis/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object srsue/test/CMakeFiles/metrics_test.dir/__/src/metrics_csv.cc.o"
	cd /home/pnatu/Work/thesis/srsLTE/build/srsue/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/metrics_test.dir/__/src/metrics_csv.cc.o -c /home/pnatu/Work/thesis/srsLTE/srsue/src/metrics_csv.cc

srsue/test/CMakeFiles/metrics_test.dir/__/src/metrics_csv.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/metrics_test.dir/__/src/metrics_csv.cc.i"
	cd /home/pnatu/Work/thesis/srsLTE/build/srsue/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pnatu/Work/thesis/srsLTE/srsue/src/metrics_csv.cc > CMakeFiles/metrics_test.dir/__/src/metrics_csv.cc.i

srsue/test/CMakeFiles/metrics_test.dir/__/src/metrics_csv.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/metrics_test.dir/__/src/metrics_csv.cc.s"
	cd /home/pnatu/Work/thesis/srsLTE/build/srsue/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pnatu/Work/thesis/srsLTE/srsue/src/metrics_csv.cc -o CMakeFiles/metrics_test.dir/__/src/metrics_csv.cc.s

# Object files for target metrics_test
metrics_test_OBJECTS = \
"CMakeFiles/metrics_test.dir/metrics_test.cc.o" \
"CMakeFiles/metrics_test.dir/__/src/metrics_stdout.cc.o" \
"CMakeFiles/metrics_test.dir/__/src/metrics_csv.cc.o"

# External object files for target metrics_test
metrics_test_EXTERNAL_OBJECTS =

srsue/test/metrics_test: srsue/test/CMakeFiles/metrics_test.dir/metrics_test.cc.o
srsue/test/metrics_test: srsue/test/CMakeFiles/metrics_test.dir/__/src/metrics_stdout.cc.o
srsue/test/metrics_test: srsue/test/CMakeFiles/metrics_test.dir/__/src/metrics_csv.cc.o
srsue/test/metrics_test: srsue/test/CMakeFiles/metrics_test.dir/build.make
srsue/test/metrics_test: lib/src/phy/libsrslte_phy.a
srsue/test/metrics_test: lib/src/common/libsrslte_common.a
srsue/test/metrics_test: lib/src/phy/libsrslte_phy.a
srsue/test/metrics_test: /usr/lib/x86_64-linux-gnu/libfftw3f.so
srsue/test/metrics_test: lib/src/srslog/libsrslog.a
srsue/test/metrics_test: lib/src/srslog/bundled/fmt/libfmt.a
srsue/test/metrics_test: /usr/lib/x86_64-linux-gnu/libmbedcrypto.so
srsue/test/metrics_test: srsue/test/CMakeFiles/metrics_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pnatu/Work/thesis/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable metrics_test"
	cd /home/pnatu/Work/thesis/srsLTE/build/srsue/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/metrics_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
srsue/test/CMakeFiles/metrics_test.dir/build: srsue/test/metrics_test

.PHONY : srsue/test/CMakeFiles/metrics_test.dir/build

srsue/test/CMakeFiles/metrics_test.dir/clean:
	cd /home/pnatu/Work/thesis/srsLTE/build/srsue/test && $(CMAKE_COMMAND) -P CMakeFiles/metrics_test.dir/cmake_clean.cmake
.PHONY : srsue/test/CMakeFiles/metrics_test.dir/clean

srsue/test/CMakeFiles/metrics_test.dir/depend:
	cd /home/pnatu/Work/thesis/srsLTE/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pnatu/Work/thesis/srsLTE /home/pnatu/Work/thesis/srsLTE/srsue/test /home/pnatu/Work/thesis/srsLTE/build /home/pnatu/Work/thesis/srsLTE/build/srsue/test /home/pnatu/Work/thesis/srsLTE/build/srsue/test/CMakeFiles/metrics_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : srsue/test/CMakeFiles/metrics_test.dir/depend

