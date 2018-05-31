! Created by Jakub Pajor on 31.05.2018.	
!#define DOT 0
!#define CACHE 0

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
        integer :: ichunk, i, j, k, ii, jj
        integer :: col, row	
	
        col = 1 ! first index in shape() stands for columns	
        row = 2 ! second index in shape() stands for rows	
        status = 0
        multiply = 0
        ichunk = 1024
        first_shape = shape(first)	
        sec_shape = shape(second)	
	
        if (first_shape(col) /= sec_shape(row)) then	
            write(*,*) 'Cant multiply because of wrong sizes'	
            multiply = 0	
            status = 1	
        end if

        write(*,*) 'DOT: ', DOT, 'CACHE: ', CACHE



        if (status == 0) then

            !Without anything
            if (DOT == 0 .and. CACHE == 0) then
                do i = 1,first_shape(row)     ! for each row of first matrix
                    do k = 1,sec_shape(col) ! for each column of second matrix
                        do j = 1,first_shape(col)
                            multiply(k,i) = multiply(k,i) + first(j,i) * second(k,j)
                        end do
                    end do
                end do
            end if



            !ONLY DOT
            if(DOT == 1 .and. CACHE == 0) then
                do i = 1,first_shape(row)     ! for each row of first matrix
                    do k = 1,sec_shape(col) ! for each column of second matrix
                        multiply(k,i)=dot_product(first(:,i),second(k,:))
                    end do
                end do
            end if



            !ONLY CACHE
            if(DOT == 0 .and. CACHE == 1) then
                do ii = 1, first_shape(row), ichunk
                    do jj = 1, sec_shape(col), ichunk
                        do i = ii,min(ii + ichunk - 1, first_shape(row))    ! for each row of first matrix
                            do k = jj, min(jj + ichunk - 1, sec_shape(col)) ! for each column of second matrix
                                do j = 1,first_shape(col)
                                    multiply(k,i) = multiply(k,i) + first(j,i) * second(k,j)
                                end do
                            end do
                        end do
                    end do
                end do
            end if


        !CACHE AND DOT
            if(DOT == 1 .and. CACHE == 1) then
                do ii = 1, first_shape(row), ichunk
                    do jj = 1, sec_shape(col), ichunk
                        do i = ii,min(ii + ichunk - 1, first_shape(row))    ! for each row of first matrix
                            do k = jj, min(jj + ichunk - 1, sec_shape(col)) ! for each column of second matrix
                                multiply(k,i)=dot_product(first(:,i),second(k,:))
                            end do
                        end do
                    end do
                end do
            end if

        end if

    end subroutine mm
end module matmult 