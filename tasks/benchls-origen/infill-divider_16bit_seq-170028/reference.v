module origen_170028 #(
    parameter DATAWIDTH = 16
) (
    input clk,
    input rst_n,
    input vld_in,
    input [DATAWIDTH-1:0] data_in,
    output [DATAWIDTH-1:0] quotient,
    output [1:0] reminder,
    output vld_out
);

reg [DATAWIDTH-1:0] data_reg;
reg [DATAWIDTH-1:0] quotient_reg;
reg [1:0] reminder_reg;
reg [DATAWIDTH-1:0] cnt;
reg [1:0] current_state, next_state;

localparam IDLE = 2'b00;
localparam DIV_STATE0 = 2'b00;
localparam DIV_STATE1 = 2'b01;
localparam DIV_STATE2 = 2'b10;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        current_state <= IDLE;
        data_reg <= {DATAWIDTH{1'b0}};
        quotient_reg <= {DATAWIDTH{1'b0}};
        reminder_reg <= 2'b00;
        cnt <= {DATAWIDTH{1'b0}};
    end
    else begin
        current_state <= next_state;
        data_reg <= (vld_in) ? data_in : data_reg >> 1;
        quotient_reg <= (next_state == DIV_STATE0) ? {quotient_reg[DATAWIDTH-2:0], data_reg[DATAWIDTH-1]} : quotient_reg;
        reminder_reg <= next_state;
        cnt <= (next_state == IDLE) ? {DATAWIDTH{1'b0}} : (cnt == DATAWIDTH) ? {DATAWIDTH{1'b0}} : cnt + 1;
    end
end

always @(*) begin
    case (current_state)
        IDLE: next_state = (vld_in) ? DIV_STATE0 : IDLE;
        DIV_STATE0: next_state = DIV_STATE1;
        DIV_STATE1: next_state = DIV_STATE2;
        DIV_STATE2: next_state = (cnt == DATAWIDTH) ? IDLE : DIV_STATE0;
        default: next_state = IDLE;
    endcase
end

assign quotient = quotient_reg;
assign reminder = reminder_reg;
assign vld_out = (current_state == IDLE) && (cnt == DATAWIDTH);

endmodule