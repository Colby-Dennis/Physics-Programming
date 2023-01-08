program exercise07
    implicit none

    character(len=12) :: ch
    real :: n

    ! Getting the command input
    call get_command_argument(1, ch)

    ! Converting from string to real
    read(ch, '(f10.0)') n
    
    open(1, file="../Unit01/Exercise07/Outputs/output.txt")
    write(1,*) n*n
    close(1)

end program exercise07