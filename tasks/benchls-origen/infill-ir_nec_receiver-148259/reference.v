module origen_148259 (
    input wire clk50,
    input wire reset_n,
    input wire ir_rx,
    output reg [31:0] ir_code,
    output reg ir_code_ack
);

// Parameters for timing
localparam LEAD_PULSE = 230000; // 4.6 ms * 50 MHz
localparam LEAD_SPACE = 210000; // 4.2 ms * 50 MHz
localparam BIT_PULSE = 41500;   // 0.83 ms * 50 MHz
localparam BIT_SPACE = 20000;   // 0.4 ms * 50 MHz
localparam TIMEOUT = 6000000;   // 120 ms * 50 MHz

// State machine states
localparam IDLE = 3'd0;
localparam LEAD_DETECT = 3'd1;
localparam DATA_RECEIVE = 3'd2;
localparam VALIDATE = 3'd3;

reg [2:0] state, next_state;
reg [31:0] shift_reg;
reg [5:0] bit_count;
reg [22:0] timer;
reg ir_rx_prev;

always @(posedge clk50 or negedge reset_n) begin
    if (!reset_n) begin
        state <= IDLE;
        ir_code <= 32'h0;
        ir_code_ack <= 1'b0;
        shift_reg <= 32'h0;
        bit_count <= 6'd0;
        timer <= 23'd0;
        ir_rx_prev <= 1'b1;
    end else begin
        state <= next_state;
        ir_rx_prev <= ir_rx;
        
        case (state)
            IDLE: begin
                ir_code_ack <= 1'b0;
                if (ir_rx == 1'b0 && ir_rx_prev == 1'b1) begin
                    timer <= 23'd0;
                end else if (ir_rx == 1'b0) begin
                    timer <= timer + 1;
                end
            end
            
            LEAD_DETECT: begin
                if (ir_rx == 1'b1) begin
                    timer <= 23'd0;
                end else begin
                    timer <= timer + 1;
                end
            end
            
            DATA_RECEIVE: begin
                timer <= timer + 1;
                if (timer == BIT_PULSE + BIT_SPACE - 1) begin
                    shift_reg <= {shift_reg[30:0], ir_rx};
                    bit_count <= bit_count + 1;
                    timer <= 23'd0;
                end
            end
            
            VALIDATE: begin
                if (shift_reg[31:16] == ~shift_reg[15:0]) begin
                    ir_code <= shift_reg;
                    ir_code_ack <= 1'b1;
                end
                timer <= 23'd0;
            end
        endcase
    end
end

always @(*) begin
    next_state = state;
    
    case (state)
        IDLE: begin
            if (timer == LEAD_PULSE - 1) begin
                next_state = LEAD_DETECT;
            end
        end
        
        LEAD_DETECT: begin
            if (timer == LEAD_SPACE - 1) begin
                next_state = DATA_RECEIVE;
            end else if (ir_rx == 1'b1) begin
                next_state = IDLE;
            end
        end
        
        DATA_RECEIVE: begin
            if (bit_count == 6'd32) begin
                next_state = VALIDATE;
            end
        end
        
        VALIDATE: begin
            next_state = IDLE;
        end
    endcase
    
    if (timer >= TIMEOUT) begin
        next_state = IDLE;
    end
end

endmodule