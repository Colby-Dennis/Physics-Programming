program exercise01
    implicit none

    character(len=80) :: inputPath, outputPath, str
    real :: m1, m2, l1, l2, a1, a2, dt, time
    real :: g, a1Dot, a2Dot, a1DotDot, a2DotDot, currentTime
    real :: x1, y1, x2, y2
    real :: num1, num2, num3, num4, denominator
    integer :: timeMultiplier

    ! Getting file paths
    inputPath = "../Unit02/Exercise01/Inputs/input.txt"
    outputPath = "../Unit02/Exercise01/Outputs/output.csv"

    ! Getting input values
    open(1, file=inputPath)
    read(1,*) str, m1
    read(1,*) str, m2
    read(1,*) str, l1
    read(1,*) str, l2
    read(1,*) str, a1
    read(1,*) str, a2
    read(1,*) str, time
    read(1,*) str, timeMultiplier
    close(1)

    ! Setting internal values
    g = 9.8
    a1Dot = 0.0
    a2Dot = 0.0
    currentTime = 0.0
    dt = (1.0/24.0)*(1.0/real(timeMultiplier))

    ! Opening file to output code
    open(1, file=outputPath)

    ! Euler method
    do while (currentTime < time)
        ! Writing out current positions
        x1 = l1 * sin(a1)
        y1 = l1 * cos(a1)
        x2 = x1 + (l2 * sin(a2))
        y2 = y1 + (l2 * cos(a2))
        write(1,*) currentTime, ",", x1, ",", y1, ",", x2, ",", y2

        ! Impleminting Euler's Method
        ! Updating angular acceleration
        num1 = m2*g*sin(a2)*cos(a1-a2)
        num2 = m2*sin(a1-a2)*((l1*a1Dot*a1Dot*cos(a1-a2))+(l2*a2Dot*a2Dot))
        num3 = (m1+m2)*g*sin(a1)
        denominator = m1 + (m2*sin(a1-a2)*sin(a1-a2))
        a1DotDot = (num1 - num2 - num3)/(l1*denominator)

        num1 = l1*a1Dot*a1Dot*sin(a1-a2)
        num2 = g*sin(a2)
        num3 = g*sin(a1)*cos(a1-a2)
        num4 = m2*l2*a2Dot*a2Dot*sin(a1-a2)*cos(a1-a2)
        a2DotDot = (((m1+m2)*(num1 - num2 + num3)) + num4)/(l2*denominator)

        ! Updating angular velocity
        a1Dot = a1Dot + (a1DotDot * dt)
        a2Dot = a2Dot + (a2DotDot * dt)

        ! Updating angle
        a1 = a1 + (a1Dot * dt)
        a2 = a2 + (a2Dot * dt)

        currentTime = currentTime + dt
    end do

end program exercise01