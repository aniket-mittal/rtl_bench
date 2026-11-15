module origen_120143 (
    output logic out,
    input logic Clock,
    input logic Reset,
    input logic In
);

    logic temp;

    always_ff @(posedge Clock) begin
        if (Reset)
            temp <= 1'b0;
        else
            temp <= In;
    end

    always_ff @(posedge Clock) begin
        if (Reset)
            out <= 1'b0;
        else
            out <= temp;
    end

endmodule

