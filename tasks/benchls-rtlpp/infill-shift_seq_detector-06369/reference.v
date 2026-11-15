module rtlpp_06369 (
    x,
    clk,
    reset,
    z
);
input   x;
input   clk;
input   reset;
output  z;

reg state_S1, state_S2, state_S3, state_S4;
reg z_out;

wire gnd;
wire vcc;

assign gnd = 1'b0;
assign vcc = 1'b1;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state_S1 <= 1'b0;
        state_S2 <= 1'b0;
        state_S3 <= 1'b0;
        state_S4 <= 1'b0;
        z_out <= 1'b0;
    end
    else begin
        // State transitions
        state_S1 <= (x && state_S2);
        state_S2 <= (x || (state_S1 && !x));
        state_S3 <= (!x && state_S2);
        state_S4 <= (!x && state_S3);
        
        // Output logic
        z_out <= (x && state_S4);
    end
end

assign z = z_out;

endmodule