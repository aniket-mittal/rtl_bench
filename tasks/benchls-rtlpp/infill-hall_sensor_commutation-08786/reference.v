module rtlpp_08786 (
    input               clk_i,
    input               rst_i,
    input       [31:0]  offset_i,   
    input       [2:0]   position_i, 
    output reg  [2:0]   position_o  
);

localparam MAX_SPEED_COUNT  = 32'h1000000;

localparam RESET            = 6'b000001;
localparam INIT             = 6'b000010;
localparam CHANGE_POSITION  = 6'b000100;
localparam DELAY_30_DEGREES = 6'b001000;
localparam APPLY_CHANGE     = 6'b010000;
localparam IDLE             = 6'b100000;

reg [5:0]   state         = RESET;  
reg [5:0]   next_state    = RESET;  
reg [2:0]   position_old  = 3'h0;   
reg [31:0]  speed_count   = 32'h0;  
reg [31:0]  speed_divider = 32'h0;  
reg [31:0]  delay_count   = 32'h0;

always @* begin
    next_state = state;

    case (state)
        RESET:
            next_state = INIT;
        INIT:
            if (position_i != position_old)
                next_state = CHANGE_POSITION;
        CHANGE_POSITION:
            next_state = DELAY_30_DEGREES;
        DELAY_30_DEGREES:
            if (delay_count > speed_divider)
                next_state = APPLY_CHANGE;
        APPLY_CHANGE:
            next_state = IDLE;
        IDLE:
            if (position_i != position_old)
                next_state = CHANGE_POSITION;
        default:
            next_state = RESET;
    endcase
end

always @(posedge clk_i) begin
    case(state)
        RESET: begin
            speed_count     <= 0;
            speed_divider   <= 0;
            position_o      <= 3'b001; // Initialization was wrong in logic (assign bit by bit was corrected)
        end
        INIT:
            if (speed_count < MAX_SPEED_COUNT)
                speed_count <= speed_count + 1;
        CHANGE_POSITION: begin
            speed_divider   <= speed_count >> 1;
            speed_count     <= 0;
            delay_count     <= 0;
        end
        DELAY_30_DEGREES: begin
            if (speed_count < MAX_SPEED_COUNT)
                speed_count <= speed_count + 1;
            delay_count <= delay_count + 1;
        end
        APPLY_CHANGE: begin
            case (position_i)
                3'b101: position_o <= 3'b100;
                3'b100: position_o <= 3'b110;
                3'b110: position_o <= 3'b010;
                3'b010: position_o <= 3'b011;
                3'b011: position_o <= 3'b001;
                3'b001: position_o <= 3'b101;
            endcase
            position_old    <= position_i;
            if (speed_count < MAX_SPEED_COUNT)
                speed_count <= speed_count + 1;
        end
        IDLE:
            if (speed_count < MAX_SPEED_COUNT)
                speed_count <= speed_count + 1;
    endcase
end

always @ (posedge clk_i) begin
    if(rst_i == 1'b1)
        state <= RESET;
    else
        state <= next_state;
end

endmodule