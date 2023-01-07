program exercise04
    implicit none

    real :: num

    ! Reading in the input
    open(1, file="../Unit01/Exercise04/Inputs/input.txt")
    read(1,*) num
    close(1)

    ! Writing out the square
    open(1, file="../Unit01/Exercise04/Outputs/output.txt")
    write(1,*) num*num
    close(1)
    
end program exercise04