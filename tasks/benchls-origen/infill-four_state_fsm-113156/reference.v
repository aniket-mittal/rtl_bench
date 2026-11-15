module origen_113156(
    input wire clk,
    input wire reset,
    input wire i1,
    input wire i0,
    output reg out2,
    output reg out1,
    output reg out0
);

    // State encoding
    localparam A = 3'b101;
    localparam B = 3'b010;
    localparam C = 3'b001;
    localparam D = 3'b100;

    reg [2:0] ps, ns;

    // Next state logic
    always @(*) begin
        case (ps)
            A: begin
                if (i1 == 0 && i0 == 0) ns = A;
                else if (i1 == 0 && i0 == 1) ns = B;
                else if (i1 == 1 && i0 == 0) ns = D;
                else ns = C;
            end
            B: begin
                if (i1 == 0 && i0 == 0) ns = A;
                else if (i1 == 0 && i0 == 1) ns = C;
                else if (i1 == 1 && i0 == 0) ns = D;
                else ns = B;
            end
            C: begin
                if (i1 == 0 && i0 == 0) ns = A;
                else if (i1 == 0 && i0 == 1) ns = D;
                else if (i1 == 1 && i0 == 0) ns = B;
                else ns = C;
            end
            D: begin
                if (i1 == 0 && i0 == 0) ns = A;
                else if (i1 == 0 && i0 == 1) ns = C;
                else if (i1 == 1 && i0 == 0) ns = B;
                else ns = D;
            end
            default: ns = C;
        endcase
    end

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            ps <= A;
        else
            ps <= ns;
    end

    // Output logic
    always @(*) begin
        {out2, out1, out0} = ps;
    end

endmodule

// Testbench
