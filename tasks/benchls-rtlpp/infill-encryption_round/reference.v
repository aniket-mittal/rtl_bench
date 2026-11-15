module encryption_round(clk, state_in, key_in, state_out);
    input clk;
    input [127:0] state_in;
    input [127:0] key_in;
    output [127:0] state_out;
    
    // Assuming simplified version of the round function
    reg [127:0] round_state;
    always @ (posedge clk) begin
        round_state <= state_in ^ key_in;
    end
    assign state_out = round_state;
endmodule