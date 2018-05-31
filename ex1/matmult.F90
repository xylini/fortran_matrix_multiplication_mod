! Created by Jakub Pajor on 31.05.2018.

module matmult
    implicit none
contains
    subroutine mm(first, second, multiply, status)

        implicit none
        real (kind = 8), intent(in) :: first(:, :)
        real (kind = 8), intent(in) :: second(:, :)
        real (kind = 8), intent(out) :: multiply(:, :)
        integer, intent(out) :: status
        integer :: first_shape(2)
        integer :: sec_shape(2)
        integer :: summ, i, j, k
        integer :: col, row

        col = 1 ! first index in shape() stands for columns
        row = 2 ! second index in shape() stands for rows
        status = 0
        first_shape = shape(first)
        sec_shape = shape(second)

        if (first_shape(col) /= sec_shape(row)) then
            write(*,*) 'Cant multiply because of wrong sizes'
            multiply = 0
            status = 1
        end if

        if (status == 0) then
            do i = 1,first_shape(row)     ! for each row of first matrix
                do k = 1,sec_shape(col) ! for each column of first matrix
                    summ = 0
                    do j = 1,first_shape(col)
                        summ = summ + first(j,i) * second(k,j)
                    end do
                    multiply(k,i) = summ
                end do
            end do
        end if
    end subroutine mm
end module matmult