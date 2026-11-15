module origen_212166(
    input TMS,
    input TCK,
    output reg enableTDO
);

parameter S_Reset = 4'b0000;
parameter S_Run_Idle = 4'b0001;
parameter S_Select_DR = 4'b0010;
parameter S_Capture_DR = 4'b0011;
parameter S_Shift_DR = 4'b0100;
parameter S_Exit1_DR = 4'b0101;
parameter S_Pause_DR = 4'b0110;
parameter S_Exit2_DR = 4'b0111;
parameter S_Update_DR = 4'b1000;
parameter S_Select_IR = 4'b1001;
parameter S_Capture_IR = 4'b1010;
parameter S_Shift_IR = 4'b1011;
parameter S_Exit1_IR = 4'b1100;
parameter S_Pause_IR = 4'b1101;
parameter S_Exit2_IR = 4'b1110;
parameter S_Update_IR = 4'b1111;

reg [3:0] state, next_state;

always @(posedge TCK) begin
    state <= next_state;
end

[MASKED]

always @(*) begin
    case (state)
        S_Shift_DR, S_Shift_IR: begin
            enableTDO = 1'b1;
        end
        default: begin
            enableTDO = 1'b0;
        end
    endcase
end

endmodule