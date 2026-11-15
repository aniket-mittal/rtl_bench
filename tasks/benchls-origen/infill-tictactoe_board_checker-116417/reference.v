module origen_116417(
    input [8:0] x,
    input [8:0] o,
    output logic error,
    output logic full,
    output logic winX,
    output logic winO,
    output logic noWin
);

    logic [8:0] sum;

    // Error detection
    always_comb begin
        error = 1'b0;
        for (int i = 0; i < 9; i = i + 1) begin
            if (x[i] && o[i]) begin
                error = 1'b1;
            end
        end
    end

    // Full board detection
    always_comb begin
        sum = x | o;
        full = &sum;
    end

    // Win detection for X
    always_comb begin
        winX = (x[0] && x[1] && x[2]) || // Row 1
               (x[3] && x[4] && x[5]) || // Row 2
               (x[6] && x[7] && x[8]) || // Row 3
               (x[0] && x[3] && x[6]) || // Column 1
               (x[1] && x[4] && x[7]) || // Column 2
               (x[2] && x[5] && x[8]) || // Column 3
               (x[0] && x[4] && x[8]) || // Diagonal 1
               (x[2] && x[4] && x[6]);   // Diagonal 2
    end

    // Win detection for O and No-win state
    always_comb begin
        winO = (o[0] && o[1] && o[2]) || // Row 1
               (o[3] && o[4] && o[5]) || // Row 2
               (o[6] && o[7] && o[8]) || // Row 3
               (o[0] && o[3] && o[6]) || // Column 1
               (o[1] && o[4] && o[7]) || // Column 2
               (o[2] && o[5] && o[8]) || // Column 3
               (o[0] && o[4] && o[8]) || // Diagonal 1
               (o[2] && o[4] && o[6]);   // Diagonal 2

        noWin = !(winX || winO);
    end

endmodule