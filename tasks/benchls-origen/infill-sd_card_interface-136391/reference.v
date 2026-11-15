module origen_136391 (
    // Host interface
    input wire clk,
    input wire rst,
    input wire [47:0] host_cmd,
    input wire [31:0] host_dat_in,
    input wire host_cmd_en,
    input wire host_dat_en,
    input wire host_dat_dir,
    input wire host_dat_ack,
    output reg host_cmd_ack,
    output reg host_dat_rdy,
    output reg [31:0] host_dat_out,

    // Device interface
    input wire [47:0] device_cmd,
    input wire [31:0] device_dat_in,
    input wire device_cmd_en,
    input wire device_dat_en,
    input wire device_dat_dir,
    input wire device_dat_ack,
    output reg device_cmd_ack,
    output reg device_dat_rdy,
    output reg [31:0] device_dat_out
);

// States
localparam IDLE = 3'b000;
localparam INIT = 3'b001;
localparam CMD  = 3'b010;
localparam DATA = 3'b011;
localparam RESP = 3'b100;

reg [2:0] state, next_state;
reg [9:0] block_counter;
reg [47:0] cmd_buffer;
reg [31:0] dat_buffer;

// State machine
always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= IDLE;
    end else begin
        state <= next_state;
    end
end

// Next state logic
always @(*) begin
    case (state)
        IDLE: next_state = (host_cmd_en || device_cmd_en) ? INIT : IDLE;
        INIT: next_state = CMD;
        CMD:  next_state = (host_cmd_en || device_cmd_en) ? RESP : CMD;
        RESP: next_state = (host_dat_en || device_dat_en) ? DATA : IDLE;
        DATA: next_state = (block_counter == 10'd511) ? IDLE : DATA;
        default: next_state = IDLE;
    endcase
end

// Command handling
always @(posedge clk) begin
    if (state == CMD) begin
        if (host_cmd_en) begin
            cmd_buffer <= host_cmd;
            host_cmd_ack <= 1'b1;
        end else if (device_cmd_en) begin
            cmd_buffer <= device_cmd;
            device_cmd_ack <= 1'b1;
        end
    end else begin
        host_cmd_ack <= 1'b0;
        device_cmd_ack <= 1'b0;
    end
end

// Data handling
always @(posedge clk) begin
    if (state == DATA) begin
        if (host_dat_en && host_dat_dir) begin
            dat_buffer <= host_dat_in;
            device_dat_out <= host_dat_in;
            device_dat_rdy <= 1'b1;
        end else if (device_dat_en && !device_dat_dir) begin
            dat_buffer <= device_dat_in;
            host_dat_out <= device_dat_in;
            host_dat_rdy <= 1'b1;
        end
        
        if (block_counter == 10'd511) begin
            block_counter <= 10'd0;
        end else begin
            block_counter <= block_counter + 1'b1;
        end
    end else begin
        host_dat_rdy <= 1'b0;
        device_dat_rdy <= 1'b0;
        block_counter <= 10'd0;
    end
end

// Initialization sequence (simplified)
reg [3:0] init_counter;
always @(posedge clk) begin
    if (state == INIT) begin
        if (init_counter < 4'd10) begin
            init_counter <= init_counter + 1'b1;
        end else begin
            init_counter <= 4'd0;
        end
    end else begin
        init_counter <= 4'd0;
    end
end

endmodule