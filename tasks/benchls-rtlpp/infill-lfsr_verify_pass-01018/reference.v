module rtlpp_01018 (
    input clk, arst,
    input verify,        
    input load,
    input [57:0] load_d,
    input evolve,
    output [63:0] q,
    output verify_fail,
    output verify_pass           
);

parameter RESET_VAL = 58'h1234567_89abcdef;

reg [57:0] lfsr;
wire [63:0] next;

assign q = {lfsr[57:0], next[63:58]};

assign next = {lfsr, lfsr[57:52]} ^ 
              {lfsr[38:0], lfsr[38:14]} ^ 
              {39'b0, lfsr[57:39], 6'b0};

always @(posedge clk or posedge arst) begin
    if (arst) begin
        lfsr <= RESET_VAL;
    end else begin
        if (load) lfsr <= load_d;
        else if (evolve) lfsr <= next[57:0];
    end
end  

reg last_verify, match;
always @(posedge clk or posedge arst) begin
    if (arst) begin
        last_verify <= 1'b0;
        match <= 1'b0;
    end else begin
        last_verify <= verify;
        match <= (lfsr == load_d);
    end
end

assign verify_fail = last_verify & !match;
assign verify_pass = last_verify & match;

endmodule