module rtlpp_04118 (
    input D,
    input Clock,
    output reg Q,
    output Qbar
);

always @(negedge Clock) begin
    Q <= D;
end

assign Qbar = ~Q;

endmodule