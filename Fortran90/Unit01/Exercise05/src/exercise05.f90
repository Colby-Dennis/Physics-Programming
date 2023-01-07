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
    write(str,*) "c: ", sqrt((a*a) + (b*b))
    write(1,*) str
    close(1)

end program exercise05