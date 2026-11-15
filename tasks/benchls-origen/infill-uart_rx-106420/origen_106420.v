module origen_106420 #(
    parameter CLK_PER_HALF_BIT = 434
) (
    input wire clk,
    input wire rstn,
    input wire rxd,
    output reg [7:0] rdata,
    output reg rdata_ready,
    output reg ferr
);

    // State definitions
    localparam [3:0] 
        s_wait = 4'd0,
        s_start = 4'd1,
        s_bit0 = 4'd2,
        s_bit1 = 4'd3,
        s_bit2 = 4'd4,
        s_bit3 = 4'd5,
        s_bit4 = 4'd6,
        s_bit5 = 4'd7,
        s_bit6 = 4'd8,
        s_bit7 = 4'd9,
        s_stop = 4'd10,
        s_send_bit = 4'd11;

    reg [3:0] state, next_state;
    reg [8:0] counter;
    reg [7:0] rxbuf;
    reg [2:0] reg1;
    reg rxd_sync;

    [MASKED]

    always @(*) begin
        next_state = state;
        case (state)
            s_wait: if (counter == 2) next_state = s_start;
            s_start: if (counter == CLK_PER_HALF_BIT * 2 - 1) next_state = s_bit0;
            s_bit0: if (counter == CLK_PER_HALF_BIT * 2 - 1) next_state = s_bit1;
            s_bit1: if (counter == CLK_PER_HALF_BIT * 2 - 1) next_state = s_bit2;
            s_bit2: if (counter == CLK_PER_HALF_BIT * 2 - 1) next_state = s_bit3;
            s_bit3: if (counter == CLK_PER_HALF_BIT * 2 - 1) next_state = s_bit4;
            s_bit4: if (counter == CLK_PER_HALF_BIT * 2 - 1) next_state = s_bit5;
            s_bit5: if (counter == CLK_PER_HALF_BIT * 2 - 1) next_state = s_bit6;
            s_bit6: if (counter == CLK_PER_HALF_BIT * 2 - 1) next_state = s_bit7;
            s_bit7: if (counter == CLK_PER_HALF_BIT * 2 - 1) next_state = s_stop;
            s_stop: if (counter == CLK_PER_HALF_BIT * 2 - 1) next_state = s_send_bit;
            s_send_bit: next_state = s_wait;
            default: next_state = s_wait;
        endcase
    end

endmodule