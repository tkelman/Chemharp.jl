
facts("UnitCell type") do
    cell = UnitCell(2, 3, 4)

    @fact lengths(cell) --> (2.0, 3.0, 4.0)
    @fact angles(cell) --> (90.0, 90.0, 90.0)

    @fact volume(cell) --> 2.0*3.0*4.0

    set_lengths!(cell, 10, 20, 30)
    @fact lengths(cell) --> (10.0, 20.0, 30.0)

    # Can not set angles for ORTHOROMBIC cell
    @fact_throws set_angles!(cell, 80, 89, 100)

    mat = reshape(Float64[10, 0, 0,
                          0, 20, 0,
                          0, 0, 30], (3, 3))
    @fact cell_matrix(cell) --> roughly(mat, 1e-10)

    @fact cell_type(cell) --> Chemharp.ORTHOROMBIC

    set_cell_type!(cell, Chemharp.TRICLINIC)
    @fact cell_type(cell) --> Chemharp.TRICLINIC

    set_angles!(cell, 80, 89, 100)
    @fact angles(cell) --> (80.0, 89.0, 100.0)

    @fact periodicity(cell) --> [true, true, true]
    set_periodicity!(cell, false, true, false)
    @fact periodicity(cell) --> [false, true, false]
end
