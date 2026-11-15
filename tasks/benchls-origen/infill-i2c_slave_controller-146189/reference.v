module origen_146189 #(
    parameter clock_freq = 100_000_000,
    parameter bit_rate = 100_000
) (
    input wire SCL,
    input wire SDA,
    input wire i_reset,
    output reg o_busy,
    output reg o_error,
    output reg [7:0] o_data
);

// Constants
localparam IDLE = 4'b0000;
localparam START = 4'b0001;
localparam ADDRESS = 4'b0010;
localparam ACK_ADDRESS = 4'b0011;
localparam DATA = 4'b0100;
localparam ACK_DATA = 4'b0101;
localparam STOP = 4'b0110;

// Internal signals
reg [3:0] state;
reg [3:0] next_state;
reg [7:0] shift_reg;
reg [3:0] bit_count;
reg [31:0] clock_count;
wire sda_in;
reg sda_out;
reg scl_out;

// Clock divider
localparam CLOCKS_PER_BIT = clock_freq / bit_rate;
reg [31:0] clk_div_counter;

// Assign SDA as input
assign sda_in = SDA;

// State machine
always @(posedge SCL or posedge i_reset) begin
    if (i_reset) begin
        state <= IDLE;
        o_busy <= 0;
        o_error <= 0;
        o_data <= 8'b0;
        shift_reg <= 8'b0;
        bit_count <= 4'b0;
        clock_count <= 32'b0;
        sda_out <= 1'b1;
        scl_out <= 1'b1;
    end else begin
        state <= next_state;
        
        case (state)
            IDLE: begin
                o_busy <= 0;
                sda_out <= 1'b1;
                scl_out <= 1'b1;
            end
            
            START: begin
                o_busy <= 1;
                sda_out <= 1'b0;
                if (clock_count == CLOCKS_PER_BIT / 2) begin
                    scl_out <= 1'b0;
                    clock_count <= 0;
                end else begin
                    clock_count <= clock_count + 1;
                end
            end
            
            ADDRESS: begin
                if (bit_count < 8) begin
                    sda_out <= shift_reg[7];
                    if (clock_count == CLOCKS_PER_BIT - 1) begin
                        shift_reg <= {shift_reg[6:0], 1'b0};
                        bit_count <= bit_count + 1;
                        clock_count <= 0;
                    end else begin
                        clock_count <= clock_count + 1;
                    end
                end
            end
            
            ACK_ADDRESS: begin
                sda_out <= 1'b1;
                if (clock_count == CLOCKS_PER_BIT / 2) begin
                    if (sda_in == 1'b1) begin
                        o_error <= 1'b1;
                    end
                    clock_count <= 0;
                end else begin
                    clock_count <= clock_count + 1;
                end
            end
            
            DATA: begin
                if (bit_count < 8) begin
                    sda_out <= shift_reg[7];
                    if (clock_count == CLOCKS_PER_BIT - 1) begin
                        shift_reg <= {shift_reg[6:0], sda_in};
                        bit_count <= bit_count + 1;
                        clock_count <= 0;
                    end else begin
                        clock_count <= clock_count + 1;
                    end
                end
            end
            
            ACK_DATA: begin
                sda_out <= 1'b1;
                if (clock_count == CLOCKS_PER_BIT / 2) begin
                    o_data <= shift_reg;
                    clock_count <= 0;
                end else begin
                    clock_count <= clock_count + 1;
                end
            end
            
            STOP: begin
                sda_out <= 1'b0;
                if (clock_count == CLOCKS_PER_BIT / 2) begin
                    scl_out <= 1'b1;
                end else if (clock_count == CLOCKS_PER_BIT) begin
                    sda_out <= 1'b1;
                    clock_count <= 0;
                end else begin
                    clock_count <= clock_count + 1;
                end
            end
        endcase
    end
end

// Next state logic
always @(*) begin
    case (state)
        IDLE: next_state = (sda_in == 1'b0 && scl_out == 1'b1) ? START : IDLE;
        START: next_state = (clock_count == CLOCKS_PER_BIT / 2) ? ADDRESS : START;
        ADDRESS: next_state = (bit_count == 8) ? ACK_ADDRESS : ADDRESS;
        ACK_ADDRESS: next_state = (clock_count == CLOCKS_PER_BIT) ? DATA : ACK_ADDRESS;
        DATA: next_state = (bit_count == 8) ? ACK_DATA : DATA;
        ACK_DATA: next_state = (clock_count == CLOCKS_PER_BIT) ? STOP : ACK_DATA;
        STOP: next_state = (clock_count == CLOCKS_PER_BIT) ? IDLE : STOP;
        default: next_state = IDLE;
    endcase
end

endmodule