module regn3(R, L, Clock, Q);
    parameter n = 6;
    input [n-1:0] R;
    input L, Clock;
    output [n-1:0] Q;
    reg [n-1:0] Q;

    always @(posedge Clock) begin
        if (L)
            Q <= R;
    end
endmodule