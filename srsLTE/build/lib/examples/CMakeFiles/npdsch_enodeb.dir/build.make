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
include lib/examples/CMakeFiles/npdsch_enodeb.dir/depend.make

# Include the progress variables for this target.
include lib/examples/CMakeFiles/npdsch_enodeb.dir/progress.make

# Include the compile flags for this target's objects.
include lib/examples/CMakeFiles/npdsch_enodeb.dir/flags.make

lib/examples/CMakeFiles/npdsch_enodeb.dir/npdsch_enodeb.c.o: lib/examples/CMakeFiles/npdsch_enodeb.dir/flags.make
lib/examples/CMakeFiles/npdsch_enodeb.dir/npdsch_enodeb.c.o: ../lib/examples/npdsch_enodeb.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pnatu/Work/thesis/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object lib/examples/CMakeFiles/npdsch_enodeb.dir/npdsch_enodeb.c.o"
	cd /home/pnatu/Work/thesis/srsLTE/build/lib/examples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/npdsch_enodeb.dir/npdsch_enodeb.c.o   -c /home/pnatu/Work/thesis/srsLTE/lib/examples/npdsch_enodeb.c

lib/examples/CMakeFiles/npdsch_enodeb.dir/npdsch_enodeb.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/npdsch_enodeb.dir/npdsch_enodeb.c.i"
	cd /home/pnatu/Work/thesis/srsLTE/build/lib/examples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pnatu/Work/thesis/srsLTE/lib/examples/npdsch_enodeb.c > CMakeFiles/npdsch_enodeb.dir/npdsch_enodeb.c.i

lib/examples/CMakeFiles/npdsch_enodeb.dir/npdsch_enodeb.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/npdsch_enodeb.dir/npdsch_enodeb.c.s"
	cd /home/pnatu/Work/thesis/srsLTE/build/lib/examples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pnatu/Work/thesis/srsLTE/lib/examples/npdsch_enodeb.c -o CMakeFiles/npdsch_enodeb.dir/npdsch_enodeb.c.s

# Object files for target npdsch_enodeb
npdsch_enodeb_OBJECTS = \
"CMakeFiles/npdsch_enodeb.dir/npdsch_enodeb.c.o"

# External object files for target npdsch_enodeb
npdsch_enodeb_EXTERNAL_OBJECTS =

lib/examples/npdsch_enodeb: lib/examples/CMakeFiles/npdsch_enodeb.dir/npdsch_enodeb.c.o
lib/examples/npdsch_enodeb: lib/examples/CMakeFiles/npdsch_enodeb.dir/build.make
lib/examples/npdsch_enodeb: lib/src/phy/libsrslte_phy.a
lib/examples/npdsch_enodeb: lib/src/phy/rf/libsrslte_rf.so.20.10.0
lib/examples/npdsch_enodeb: lib/src/phy/rf/libsrslte_rf_utils.a
lib/examples/npdsch_enodeb: lib/src/phy/libsrslte_phy.a
lib/examples/npdsch_enodeb: /usr/lib/x86_64-linux-gnu/libfftw3f.so
lib/examples/npdsch_enodeb: /usr/lib/x86_64-linux-gnu/libuhd.so
lib/examples/npdsch_enodeb: lib/examples/CMakeFiles/npdsch_enodeb.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pnatu/Work/thesis/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable npdsch_enodeb"
	cd /home/pnatu/Work/thesis/srsLTE/build/lib/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/npdsch_enodeb.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/examples/CMakeFiles/npdsch_enodeb.dir/build: lib/examples/npdsch_enodeb

.PHONY : lib/examples/CMakeFiles/npdsch_enodeb.dir/build

lib/examples/CMakeFiles/npdsch_enodeb.dir/clean:
	cd /home/pnatu/Work/thesis/srsLTE/build/lib/examples && $(CMAKE_COMMAND) -P CMakeFiles/npdsch_enodeb.dir/cmake_clean.cmake
.PHONY : lib/examples/CMakeFiles/npdsch_enodeb.dir/clean

lib/examples/CMakeFiles/npdsch_enodeb.dir/depend:
	cd /home/pnatu/Work/thesis/srsLTE/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pnatu/Work/thesis/srsLTE /home/pnatu/Work/thesis/srsLTE/lib/examples /home/pnatu/Work/thesis/srsLTE/build /home/pnatu/Work/thesis/srsLTE/build/lib/examples /home/pnatu/Work/thesis/srsLTE/build/lib/examples/CMakeFiles/npdsch_enodeb.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/examples/CMakeFiles/npdsch_enodeb.dir/depend

