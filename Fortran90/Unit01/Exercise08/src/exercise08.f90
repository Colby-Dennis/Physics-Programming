program exercise08
    implicit none

    character(len=260) :: path, inputPath, outputPath
    real :: a
    integer :: io

    ! Creating the paths
    call get_command_argument(1, path)
    inputPath = trim(path)//"Inputs/input.txt"
    outputPath = trim(path)//"Outputs/output.txt"

    ! Opening the input and output files
    open(1, file=inputPath)
    open(2, file=outputPath)

    ! Reading in the input data, squaring, and writing
    !   to output file
    do 
        read(1,*,iostat=io) a
        if (io/=0) exit
        write(2,*) a*a
    end do

    ! Closing the files
    close(1)
    close(2)

end program exercise08