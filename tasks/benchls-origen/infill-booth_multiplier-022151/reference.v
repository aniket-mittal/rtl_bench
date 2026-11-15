module origen_022151 #(parameter N = 25) (
    output reg [2*N-3:0] prod,
    output reg mult_done,
    input [N-1:0] mc, mp,
    input clk, reset, mult_term, start
);

reg [N-1:0] A, Q, M;
reg Q_1;
reg [4:0] count;
reg mult_act;

wire [N-1:0] TWOS_COMP_M;
assign TWOS_COMP_M = ~M + 1'b1;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        A <= 0;
        Q <= 0;
        Q_1 <= 0;
        M <= 0;
        count <= 0;
        mult_act <= 0;
        mult_done <= 0;
    end else if (start) begin
        A <= 0;
        M <= mc;
        Q <= mp;
        Q_1 <= 0;
        count <= 0;
        mult_act <= 1;
        mult_done <= 0;
    end else if (mult_term) begin
        mult_act <= 0;
    end else if (mult_act) begin
        case ({Q[0], Q_1})
            2'b10: A <= A + TWOS_COMP_M;
            2'b01: A <= A + M;
            default: A <= A;
        endcase

        {A, Q, Q_1} <= {A[N-1], A, Q};
        count <= count + 1;

        if (count == N-1) begin
            mult_act <= 0;
            mult_done <= 1;
        end
    end
end

always @(A, Q) begin
    prod = {A[N-3:0], Q};
end

endmodule