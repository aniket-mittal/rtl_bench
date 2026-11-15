module origen_148100 (
    input wire sys_clk,
    input wire sys_rst,
    input wire [13:0] csr_a,
    input wire csr_we,
    input wire [31:0] csr_di,
    input wire [3:0] mc_d,
    input wire mc_cmd,
    input wire mc_clk,
    output reg [31:0] csr_do
);

// Configuration registers
reg [31:0] config_reg [15:0];
reg [3:0] mc_d_out;
reg mc_cmd_out;
reg mc_clk_out;

// State machine states
localparam IDLE = 3'd0;
localparam INIT = 3'd1;
localparam CMD_SEND = 3'd2;
localparam DATA_READ = 3'd3;
localparam DATA_WRITE = 3'd4;

reg [2:0] state, next_state;
reg [7:0] cmd_buffer;
reg [7:0] data_buffer;
reg [5:0] bit_counter;

// SPI mode configuration
always @(posedge sys_clk or posedge sys_rst) begin
    if (sys_rst) begin
        mc_clk_out <= 1'b0;
    end else begin
        mc_clk_out <= ~mc_clk_out;
    end
end

// Configuration register access
always @(posedge sys_clk) begin
    if (csr_we) begin
        config_reg[csr_a[3:0]] <= csr_di;
    end
    csr_do <= config_reg[csr_a[3:0]];
end

// State machine
always @(posedge sys_clk or posedge sys_rst) begin
    if (sys_rst) begin
        state <= IDLE;
    end else begin
        state <= next_state;
    end
end

always @(*) begin
    next_state = state;
    case (state)
        IDLE: begin
            if (config_reg[0][0]) next_state = INIT;
        end
        INIT: begin
            if (bit_counter == 6'd47) next_state = CMD_SEND;
        end
        CMD_SEND: begin
            if (bit_counter == 6'd47) begin
                if (config_reg[1][0]) next_state = DATA_READ;
                else if (config_reg[1][1]) next_state = DATA_WRITE;
                else next_state = IDLE;
            end
        end
        DATA_READ: begin
            if (bit_counter == 6'd511) next_state = IDLE;
        end
        DATA_WRITE: begin
            if (bit_counter == 6'd511) next_state = IDLE;
        end
    endcase
end

// Command and data handling
always @(posedge sys_clk or posedge sys_rst) begin
    if (sys_rst) begin
        bit_counter <= 6'd0;
        cmd_buffer <= 8'd0;
        data_buffer <= 8'd0;
        mc_d_out <= 4'b1111;
        mc_cmd_out <= 1'b1;
    end else begin
        case (state)
            IDLE: begin
                bit_counter <= 6'd0;
                mc_d_out <= 4'b1111;
                mc_cmd_out <= 1'b1;
            end
            INIT: begin
                if (mc_clk_out) begin
                    mc_cmd_out <= cmd_buffer[7];
                    cmd_buffer <= {cmd_buffer[6:0], 1'b1};
                    bit_counter <= bit_counter + 1;
                end
            end
            CMD_SEND: begin
                if (mc_clk_out) begin
                    mc_cmd_out <= cmd_buffer[7];
                    cmd_buffer <= {cmd_buffer[6:0], 1'b1};
                    bit_counter <= bit_counter + 1;
                end
            end
            DATA_READ: begin
                if (mc_clk_out) begin
                    data_buffer <= {data_buffer[6:0], mc_d[0]};
                    bit_counter <= bit_counter + 1;
                    if (bit_counter[2:0] == 3'b111) begin
                        config_reg[2] <= {config_reg[2][23:0], data_buffer};
                    end
                end
            end
            DATA_WRITE: begin
                if (mc_clk_out) begin
                    mc_d_out[0] <= data_buffer[7];
                    data_buffer <= {data_buffer[6:0], 1'b0};
                    bit_counter <= bit_counter + 1;
                    if (bit_counter[2:0] == 3'b000) begin
                        data_buffer <= config_reg[3][31:24];
                        config_reg[3] <= {config_reg[3][23:0], 8'd0};
                    end
                end
            end
        endcase
    end
end

endmodule