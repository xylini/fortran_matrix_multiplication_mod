! Created by Jakub Pajor on 29.05.2018.
program main
    use matmult
    implicit none


    real(kind = 8) :: first(1,50)  ! columns, rows
    real(kind = 8) :: second(1,50) ! columns, rows
    real(kind = 8), allocatable :: result(:,:)
    integer :: first_shape(2)
    integer :: sec_shape(2)
    integer :: status ! kod błędu, 0 gdy OK

    first_shape = shape(first)
    sec_shape = shape(second)

    allocate(result(sec_shape(1),first_shape(2)))


    first = 1
    second = 2
    call mm(first,second,result,status)

    if(status /= 0) then
        deallocate(result)
        stop 1
    end if

    write(*,*) result

    deallocate(result)
end program main