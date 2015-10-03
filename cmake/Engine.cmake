#
# Copyright (c) 2015 Nikolay Zapolnov (zapolnov@gmail.com).
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#

cmake_minimum_required(VERSION 3.2)

if(NOT _B3D_ENGINE_INCLUDED)
    set(_B3D_ENGINE_INCLUDED TRUE)

    get_filename_component(CMakeScriptsPath "${CMAKE_CURRENT_LIST_FILE}" ABSOLUTE)
    get_filename_component(CMakeScriptsPath "${CMakeScriptsPath}" PATH)
    get_filename_component(EnginePath "${CMakeScriptsPath}" PATH)

    if(POLICY CMP0063)
        cmake_policy(SET CMP0063 NEW)
    endif()

    set(CMAKE_VISIBILITY_INLINES_HIDDEN TRUE)
    set(CMAKE_C_VISIBILITY_PRESET hidden)
    set(CMAKE_CXX_VISIBILITY_PRESET hidden)
    set_property(GLOBAL PROPERTY PREDEFINED_TARGETS_FOLDER "Bombyx3D")
    set_property(GLOBAL PROPERTY USE_FOLDERS TRUE)

    if(B3D_GCC_BITS)
        set(B3D_GCC_BITS "${B3D_GCC_BITS}" CACHE INTERNAL "" FORCE)
        add_definitions("-m${B3D_GCC_BITS}")
    endif()

    include("${CMakeScriptsPath}/EnableSSE2.cmake")
    include("${CMakeScriptsPath}/DetectTargetPlatform.cmake")
    include("${CMakeScriptsPath}/SetSourceGroups.cmake")
    include("${CMakeScriptsPath}/TargetLinkLibrary.cmake")
    include("${CMakeScriptsPath}/AddLibrary.cmake")
    include("${CMakeScriptsPath}/AddPlugin.cmake")
    include("${CMakeScriptsPath}/AddExecutable.cmake")

    find_package(Threads REQUIRED)
    include_directories("${EnginePath}")

    if(NOT TARGET engine)
        file(MAKE_DIRECTORY "${CMAKE_BINARY_DIR}/bombyx3d")
        add_subdirectory("${EnginePath}/engine" "${CMAKE_BINARY_DIR}/bombyx3d")
    endif()
endif()
