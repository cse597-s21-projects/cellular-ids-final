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
include lib/examples/CMakeFiles/cell_search.dir/depend.make

# Include the progress variables for this target.
include lib/examples/CMakeFiles/cell_search.dir/progress.make

# Include the compile flags for this target's objects.
include lib/examples/CMakeFiles/cell_search.dir/flags.make

lib/examples/CMakeFiles/cell_search.dir/cell_search.c.o: lib/examples/CMakeFiles/cell_search.dir/flags.make
lib/examples/CMakeFiles/cell_search.dir/cell_search.c.o: ../lib/examples/cell_search.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pnatu/Work/thesis/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object lib/examples/CMakeFiles/cell_search.dir/cell_search.c.o"
	cd /home/pnatu/Work/thesis/srsLTE/build/lib/examples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/cell_search.dir/cell_search.c.o   -c /home/pnatu/Work/thesis/srsLTE/lib/examples/cell_search.c

lib/examples/CMakeFiles/cell_search.dir/cell_search.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/cell_search.dir/cell_search.c.i"
	cd /home/pnatu/Work/thesis/srsLTE/build/lib/examples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pnatu/Work/thesis/srsLTE/lib/examples/cell_search.c > CMakeFiles/cell_search.dir/cell_search.c.i

lib/examples/CMakeFiles/cell_search.dir/cell_search.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/cell_search.dir/cell_search.c.s"
	cd /home/pnatu/Work/thesis/srsLTE/build/lib/examples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pnatu/Work/thesis/srsLTE/lib/examples/cell_search.c -o CMakeFiles/cell_search.dir/cell_search.c.s

# Object files for target cell_search
cell_search_OBJECTS = \
"CMakeFiles/cell_search.dir/cell_search.c.o"

# External object files for target cell_search
cell_search_EXTERNAL_OBJECTS =

lib/examples/cell_search: lib/examples/CMakeFiles/cell_search.dir/cell_search.c.o
lib/examples/cell_search: lib/examples/CMakeFiles/cell_search.dir/build.make
lib/examples/cell_search: lib/src/phy/libsrslte_phy.a
lib/examples/cell_search: lib/src/common/libsrslte_common.a
lib/examples/cell_search: lib/src/phy/rf/libsrslte_rf.so.20.10.0
lib/examples/cell_search: lib/src/srslog/libsrslog.a
lib/examples/cell_search: lib/src/srslog/bundled/fmt/libfmt.a
lib/examples/cell_search: /usr/lib/x86_64-linux-gnu/libmbedcrypto.so
lib/examples/cell_search: lib/src/phy/rf/libsrslte_rf_utils.a
lib/examples/cell_search: lib/src/phy/libsrslte_phy.a
lib/examples/cell_search: /usr/lib/x86_64-linux-gnu/libfftw3f.so
lib/examples/cell_search: /usr/lib/x86_64-linux-gnu/libuhd.so
lib/examples/cell_search: lib/examples/CMakeFiles/cell_search.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pnatu/Work/thesis/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable cell_search"
	cd /home/pnatu/Work/thesis/srsLTE/build/lib/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cell_search.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/examples/CMakeFiles/cell_search.dir/build: lib/examples/cell_search

.PHONY : lib/examples/CMakeFiles/cell_search.dir/build

lib/examples/CMakeFiles/cell_search.dir/clean:
	cd /home/pnatu/Work/thesis/srsLTE/build/lib/examples && $(CMAKE_COMMAND) -P CMakeFiles/cell_search.dir/cmake_clean.cmake
.PHONY : lib/examples/CMakeFiles/cell_search.dir/clean

lib/examples/CMakeFiles/cell_search.dir/depend:
	cd /home/pnatu/Work/thesis/srsLTE/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pnatu/Work/thesis/srsLTE /home/pnatu/Work/thesis/srsLTE/lib/examples /home/pnatu/Work/thesis/srsLTE/build /home/pnatu/Work/thesis/srsLTE/build/lib/examples /home/pnatu/Work/thesis/srsLTE/build/lib/examples/CMakeFiles/cell_search.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/examples/CMakeFiles/cell_search.dir/depend
