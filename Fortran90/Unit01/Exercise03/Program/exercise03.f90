program exercise03
    implicit none

    real :: input
    
    open(1, file="../Unit01/Exercise03/Inputs/input.txt", status = "old")
    read(1,*) input
    close(1)

    print*, input*input

end program exercise03