module FD (Q, C, D);
    parameter INIT = 1'b0;

    output Q;
    input  C, D;

    reg Q;

    always @(posedge C) begin
        Q <= D;
    end
endmodule