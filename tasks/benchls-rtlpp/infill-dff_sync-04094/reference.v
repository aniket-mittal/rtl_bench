module rtlpp_04094 (
    input d,
    input clk,
    output q
);

reg q_int;

always @(posedge clk) begin
    q_int <= d;
end

assign q = q_int;

endmodule