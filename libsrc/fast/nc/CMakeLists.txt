if (HAS_NC AND BUILD_FAST_IO)
    add_library(ncio  m_ncio.f90)
    target_include_directories(ncio PUBLIC $<BUILD_INTERFACE:$ENV{NC_INCLUDE}>)
endif()
