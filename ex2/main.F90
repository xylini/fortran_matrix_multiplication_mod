! Created by Jakub Pajor on 29.05.2018.	
program main
    implicit none	
	
	
    real(kind = 8) :: first(3,3)  ! columns, rows
    real(kind = 8) :: second(3,3) ! columns, rows
    real(kind = 8), allocatable :: result(:,:)	
    integer :: first_shape(2)	
    integer :: sec_shape(2)	
    integer :: status ! kod błędu, 0 gdy OK	
	
    first_shape = shape(first)	
    sec_shape = shape(second)	
	
    allocate(result(sec_shape(1),first_shape(2)))	
	
	
    first = 2
    first(1,3) = 1
!    call mm(first,second,result,status)
!
!    if(status /= 0) then
!        deallocate(result)
!        stop 1
!    end if


	
    write(*,*) first
	
    deallocate(result)	
end program main 