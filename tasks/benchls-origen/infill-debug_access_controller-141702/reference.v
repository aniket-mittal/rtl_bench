module origen_141702 (
    input wire clk,
    input wire rst_n,
    input wire [7:0] cmd_in,
    input wire cmd_valid,
    output reg [7:0] resp_out,
    output reg resp_valid,
    input wire [7:0] debug_data_in,
    output reg [7:0] debug_data_out,
    output reg [8:0] debug_addr,
    output reg debug_we
);

    // Debug ROM (512 bytes)
    reg [7:0] debug_rom [0:511];
    
    // Debug RAM (assume 256 bytes for this example)
    reg [7:0] debug_ram [0:255];
    
    // Processor halt notifications (assume 8 processors)
    reg [7:0] halt_notifications;
    
    // Debug interrupt flag
    reg debug_interrupt;
    
    // Command decoding
    localparam CMD_READ_ROM  = 8'h01;
    localparam CMD_READ_RAM  = 8'h02;
    localparam CMD_WRITE_RAM = 8'h03;
    localparam CMD_SET_HALT  = 8'h04;
    localparam CMD_CLR_HALT  = 8'h05;
    localparam CMD_CLR_INT   = 8'h06;
    
    // State machine
    reg [2:0] state;
    localparam IDLE = 3'd0, READ_ADDR = 3'd1, READ_DATA = 3'd2, WRITE_DATA = 3'd3, SEND_RESP = 3'd4;
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= IDLE;
            resp_out <= 8'h00;
            resp_valid <= 1'b0;
            debug_addr <= 9'h000;
            debug_we <= 1'b0;
            halt_notifications <= 8'h00;
            debug_interrupt <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    if (cmd_valid) begin
                        case (cmd_in)
                            CMD_READ_ROM, CMD_READ_RAM, CMD_WRITE_RAM: state <= READ_ADDR;
                            CMD_SET_HALT: begin
                                halt_notifications <= halt_notifications | debug_data_in;
                                state <= SEND_RESP;
                            end
                            CMD_CLR_HALT: begin
                                halt_notifications <= halt_notifications & ~debug_data_in;
                                state <= SEND_RESP;
                            end
                            CMD_CLR_INT: begin
                                debug_interrupt <= 1'b0;
                                state <= SEND_RESP;
                            end
                            default: state <= SEND_RESP;
                        endcase
                    end
                end
                READ_ADDR: begin
                    debug_addr <= debug_data_in;
                    state <= (cmd_in == CMD_WRITE_RAM) ? WRITE_DATA : READ_DATA;
                end
                READ_DATA: begin
                    if (cmd_in == CMD_READ_ROM)
                        resp_out <= debug_rom[debug_addr];
                    else // CMD_READ_RAM
                        resp_out <= debug_ram[debug_addr[7:0]];
                    state <= SEND_RESP;
                end
                WRITE_DATA: begin
                    debug_ram[debug_addr[7:0]] <= debug_data_in;
                    debug_we <= 1'b1;
                    state <= SEND_RESP;
                end
                SEND_RESP: begin
                    resp_valid <= 1'b1;
                    debug_we <= 1'b0;
                    state <= IDLE;
                end
            endcase
        end
    end
    
    // Debug data output
    always @(*) begin
        if (state == READ_DATA)
            debug_data_out = (cmd_in == CMD_READ_ROM) ? debug_rom[debug_addr] : debug_ram[debug_addr[7:0]];
        else
            debug_data_out = 8'h00;
    end

endmodule