! Created by ${USER_NAME} on 01.06.2018.

program mainmatmul
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
    result = matmul(first,second)
    call cpu_time(stop)
    write(*,*) stop-start

    deallocate(first)
    deallocate(second)
    deallocate(result)
end program mainmatmul