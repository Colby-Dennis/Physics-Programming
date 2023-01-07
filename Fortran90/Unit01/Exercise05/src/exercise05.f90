program exercise05
    implicit none
    
    real :: a, b
    character(45) :: str

    ! Reading in the data
    open(1, file="../Unit01/Exercise05/Inputs/input.txt")
    read(1,*) str, a
    read(1,*) str, b
    close(1)

    ! Writing out the hypotenuse
    open(1, file="../Unit01/Exercise05/Outputs/output.txt")
    write(1,*) sqrt((a*a) + (b*b))
    close(1)

end program exercise05