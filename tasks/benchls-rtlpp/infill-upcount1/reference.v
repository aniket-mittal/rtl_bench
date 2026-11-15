module upcount1(Clear, Clock, Q);
    input Clear, Clock;
    output [1:0] Q;
    reg [1:0] Q;

    always @(posedge Clock) begin
        if (Clear)
            Q <= 0;
        else
            Q <= Q + 1;
    end
endmodule