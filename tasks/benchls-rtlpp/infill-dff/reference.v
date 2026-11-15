module DFF(CK, D, Q, QN);
    input [0:0] CK;
    input [0:0] D;
    output [0:0] Q;
    output [0:0] QN;
    reg [0:0] Q;

    assign QN = ~Q;

    always @(posedge CK) begin
        Q <= D;
    end
endmodule