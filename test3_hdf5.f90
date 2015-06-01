program Test3_HDF5
!$$$  program documentation block
!         .           .            .
!  program name: Test3_HDF5
!    programmer: da,cheng        org: umd      date: 2015-Jun-01
!
!  purpose:
!    Test whether Module_HDF4 can work correctly.
!
!  revision history:
!    2015-Jun-01     da    - creator
!
!  file dependencies:
!
!  attributes: 
!    language: fortran 90
!    machine : 
!
!
!$$$ end documentation block
  Use Module_HDF5
  Implicit None

  Character(256)         :: var_name
  Integer(4),allocatable :: var_val(:,:), var2_val(:,:)
  
  Integer(4)             :: nx, ny, nx2, ny2
  Integer(4)             :: ix, iy
  Integer(4)             :: ios


  var_name  = "latitude"
  nx = 19
  ny = 1
  Allocate( var_val(nx,ny) )
  Do ix = 1, nx
    var_val(ix,ny) = -90 + 10*(ix-1)
  Enddo


! get data from hdf4 file
  ios = H5_ReadVar2d( "hdf5_testdata.h5", TRIM(var_name), var2_val )
! 
  Write(*,*) "Original data--------------------------"
  Write(*,*) "varname = ", TRIM(var_name)
  Write(*,*) "size of var = ", nx, ny
  Write(*,*) "var values:"
  Write(*,"(20(I4))") ( var_val(ix,ny), ix = 1, nx )

  Write(*,*) "Read from HDF5 file--------------------"
  Write(*,*) "varname = ", TRIM(var_name)
  Write(*,*) "size of var = ", SHAPE(var2_val) 
  Write(*,*) "var values:"
  Write(*,"(20(I4))") ( var2_val(ix,ny), ix = 1, nx )

  Deallocate( var_val, var2_val )


endprogram
