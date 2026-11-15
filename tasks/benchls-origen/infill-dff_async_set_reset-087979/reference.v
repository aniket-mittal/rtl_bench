module origen_087979 (
    input wire clock,
    input wire data,
    input wire preset,
    input wire reset,
    output reg Q
);

    always @(posedge clock or negedge preset or negedge reset) begin
        if (!preset)
            Q <= 1'b1;
        else if (!reset)
            Q <= 1'b0;
        else
            Q <= data;
    end

endmodule

module lab_TFF (
    input wire clock,
    input wire t,
    input wire preset,
    input wire reset,
    output reg Q
);

    always @(posedge clock or negedge preset or negedge reset) begin
        if (!preset)
            Q <= 1'b1;
        else if (!reset)
            Q <= 1'b0;
        else
            Q <= t ? ~Q : Q;
    end

endmodule

module lab_JKFF (
    input wire clock,
    input wire J,
    input wire K,
    input wire preset,
    input wire reset,
    output reg Q
);

    always @(posedge clock or negedge preset or negedge reset) begin
        if (!preset)
            Q <= 1'b1;
        else if (!reset)
            Q <= 1'b0;
        else
            Q <= (J & ~Q) | (~K & Q);
    end

endmodule