! Created by Jakub Pajor on 29.05.2018.	
program main
    use matmult
    implicit none
    real(kind = 8), allocatable :: first(:,:)  ! columns, rows
    real(kind = 8), allocatable :: second(:,:) ! columns, rows
    real(kind = 8), allocatable :: result(:,:)
    integer :: status ! kod błędu, 0 gdy OK
    integer (kind = 8) :: N
    character (len=16) :: args
    real :: start, stop

    call get_command_argument(1, args)
    read(args(1:len_trim(args)),'(i8)') N
	
    allocate(first(N,N))
    allocate(second(N,N))
    allocate(result(N,N))

    first = 1
    second = 1

    call cpu_time(start)
    call mm(first, second, result, status)
    call cpu_time(stop)
    write(*,*) stop-start

    deallocate(first)
    deallocate(second)
    deallocate(result)	
end program main 