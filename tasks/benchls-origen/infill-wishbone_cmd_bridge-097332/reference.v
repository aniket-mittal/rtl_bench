module origen_097332 (
    input wire i_clk,
    input wire i_cmd_reset,
    input wire i_cmd_valid,
    input wire [35:0] i_cmd_data,
    output reg o_cmd_ready,
    output reg o_resp_valid,
    output reg [35:0] o_resp_data,
    output reg o_wb_cyc,
    output reg o_wb_stb,
    output reg o_wb_we,
    output reg [31:0] o_wb_addr,
    output reg [31:0] o_wb_data,
    input wire i_wb_ack,
    input wire i_wb_err,
    input wire i_wb_stall,
    input wire [31:0] i_wb_data
);

    // Command types
    localparam [3:0] READ_REQ = 4'b0001;
    localparam [3:0] WRITE_REQ = 4'b0010;
    localparam [3:0] SET_ADDR = 4'b0011;
    localparam [3:0] SET_ADDR_INC = 4'b0100;

    // Response types
    localparam [3:0] READ_RESP = 4'b0001;
    localparam [3:0] WRITE_ACK = 4'b0010;
    localparam [3:0] ADDR_ACK = 4'b0011;
    localparam [3:0] BUS_ERROR = 4'b1110;
    localparam [3:0] BUS_RESET = 4'b1111;

    // State machine states
    localparam [2:0] IDLE = 3'b000;
    localparam [2:0] BUSY = 3'b001;
    localparam [2:0] WAIT_ACK = 3'b010;
    localparam [2:0] COMPLETE = 3'b011;
    localparam [2:0] ERROR = 3'b100;

    reg [2:0] state;
    reg [31:0] current_addr;
    reg addr_auto_inc;
    reg [3:0] current_cmd;

    always @(posedge i_clk) begin
        if (i_cmd_reset) begin
            state <= IDLE;
            o_wb_cyc <= 1'b0;
            o_wb_stb <= 1'b0;
            o_wb_we <= 1'b0;
            o_cmd_ready <= 1'b1;
            o_resp_valid <= 1'b0;
            addr_auto_inc <= 1'b0;
            o_resp_data <= {BUS_RESET, 32'b0};
        end else begin
            case (state)
                IDLE: begin
                    o_cmd_ready <= 1'b1;
                    if (i_cmd_valid) begin
                        current_cmd <= i_cmd_data[35:32];
                        case (i_cmd_data[35:32])
                            READ_REQ: begin
                                state <= BUSY;
                                o_wb_cyc <= 1'b1;
                                o_wb_stb <= 1'b1;
                                o_wb_we <= 1'b0;
                                o_wb_addr <= current_addr;
                                o_cmd_ready <= 1'b0;
                            end
                            WRITE_REQ: begin
                                state <= BUSY;
                                o_wb_cyc <= 1'b1;
                                o_wb_stb <= 1'b1;
                                o_wb_we <= 1'b1;
                                o_wb_addr <= current_addr;
                                o_wb_data <= i_cmd_data[31:0];
                                o_cmd_ready <= 1'b0;
                            end
                            SET_ADDR: begin
                                current_addr <= i_cmd_data[31:0];
                                addr_auto_inc <= 1'b0;
                                o_resp_valid <= 1'b1;
                                o_resp_data <= {ADDR_ACK, i_cmd_data[31:0]};
                            end
                            SET_ADDR_INC: begin
                                current_addr <= i_cmd_data[31:0];
                                addr_auto_inc <= 1'b1;
                                o_resp_valid <= 1'b1;
                                o_resp_data <= {ADDR_ACK, i_cmd_data[31:0]};
                            end
                            default: begin
                                // Invalid command
                                o_resp_valid <= 1'b1;
                                o_resp_data <= {BUS_ERROR, 32'b0};
                            end
                        endcase
                    end else begin
                        o_resp_valid <= 1'b0;
                    end
                end
                BUSY: begin
                    if (!i_wb_stall) begin
                        state <= WAIT_ACK;
                        o_wb_stb <= 1'b0;
                    end
                end
                WAIT_ACK: begin
                    if (i_wb_ack) begin
                        state <= COMPLETE;
                        o_wb_cyc <= 1'b0;
                        if (addr_auto_inc) current_addr <= current_addr + 4;
                    end else if (i_wb_err) begin
                        state <= ERROR;
                        o_wb_cyc <= 1'b0;
                    end
                end
                COMPLETE: begin
                    o_resp_valid <= 1'b1;
                    case (current_cmd)
                        READ_REQ: o_resp_data <= {READ_RESP, i_wb_data};
                        WRITE_REQ: o_resp_data <= {WRITE_ACK, 32'b0};
                    endcase
                    state <= IDLE;
                end
                ERROR: begin
                    o_resp_valid <= 1'b1;
                    o_resp_data <= {BUS_ERROR, 32'b0};
                    state <= IDLE;
                end
            endcase
        end
    end

endmodule