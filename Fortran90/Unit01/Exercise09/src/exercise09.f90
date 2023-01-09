program exercise09
    implicit none

    character(len=120) :: inputPath, outputPath, fileName
    real :: a

    ! Getting the input file name and output file
    call get_command_argument(1, fileName)
    inputPath = "../Unit01/Exercise09/Inputs/"//trim(fileName)
    outputPath = "../Unit01/Exercise09/Outputs/output.txt"

    ! Reading the number in the file
    open(1, file=inputPath)
    read(1,*) a
    close(1)

    open(1, file=outputPath)
    write(1,*) a*a*a
    close(1)

end program exercise09