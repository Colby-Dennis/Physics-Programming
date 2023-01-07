program exercise06
    implicit none
    integer :: i

    open(1, file="../Unit01/Exercise06/Outputs/output.csv")
    open(2, file="../Unit01/exercise06/Outputs/output.txt")
    write(1,*) "Number, Square"
    write(2,*) "Number", char(9), "Square"
    do i = 1, 25
        write(1,*) i, ", ", real(i)*real(i)
        write(2,*) i, char(9), real(i)*real(i)
    end do
    close(1)
    close(2)
    
end program exercise06