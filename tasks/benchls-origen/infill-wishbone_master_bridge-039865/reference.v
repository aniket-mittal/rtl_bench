module origen_039865 (
    input wire clk,
    input wire rst,
    output reg done_o,
    input wire d_read_en,
    input wire d_write_en,
    input wire [31:0] d_addr,
    input wire [31:0] d_write_data,
    output reg [31:0] d_data_out,
    input wire wbm_done_pls_i,
    input wire [31:0] wbm_dat_i,
    input wire wbm_ack_i,
    output reg [31:0] wbm_dat_o,
    output reg wbm_we_o,
    output wire [3:0] wbm_sel_o,
    output reg [31:0] wbm_adr_o,
    output reg wbm_cyc_o,
    output reg wbm_stb_o
);

    // State definition
    localparam IDLE = 2'b00;
    localparam WRITE_ACK = 2'b01;
    localparam READ_ACK = 2'b10;
    localparam DONE_PLS = 2'b11;

    reg [1:0] state, next_state;
    reg d_read_en_r, d_write_en_r;
    wire d_read_en_posedge, d_write_en_posedge;

    // Edge detection
    assign d_read_en_posedge = d_read_en & ~d_read_en_r;
    assign d_write_en_posedge = d_write_en & ~d_write_en_r;

    // Wishbone select signal (always active)
    assign wbm_sel_o = 4'b1111;

    // State machine
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            d_read_en_r <= 1'b0;
            d_write_en_r <= 1'b0;
        end else begin
            state <= next_state;
            d_read_en_r <= d_read_en;
            d_write_en_r <= d_write_en;
        end
    end

    // Next state logic
    always @(*) begin
        next_state = state;
        case (state)
            IDLE: begin
                if (wbm_done_pls_i)
                    next_state = DONE_PLS;
                else if (d_write_en_posedge)
                    next_state = WRITE_ACK;
                else if (d_read_en_posedge)
                    next_state = READ_ACK;
            end
            WRITE_ACK, READ_ACK: begin
                if (wbm_ack_i)
                    next_state = IDLE;
            end
            DONE_PLS: begin
                if (~wbm_done_pls_i)
                    next_state = IDLE;
            end
        endcase
    end

    // Output logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            done_o <= 1'b0;
            d_data_out <= 32'b0;
            wbm_dat_o <= 32'b0;
            wbm_we_o <= 1'b0;
            wbm_adr_o <= 32'b0;
            wbm_cyc_o <= 1'b0;
            wbm_stb_o <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    done_o <= 1'b0;
                    if (d_write_en_posedge) begin
                        wbm_dat_o <= d_write_data;
                        wbm_we_o <= 1'b1;
                        wbm_adr_o <= d_addr;
                        wbm_cyc_o <= 1'b1;
                        wbm_stb_o <= 1'b1;
                    end else if (d_read_en_posedge) begin
                        wbm_we_o <= 1'b0;
                        wbm_adr_o <= d_addr;
                        wbm_cyc_o <= 1'b1;
                        wbm_stb_o <= 1'b1;
                    end
                end
                WRITE_ACK, READ_ACK: begin
                    if (wbm_ack_i) begin
                        wbm_cyc_o <= 1'b0;
                        wbm_stb_o <= 1'b0;
                        wbm_we_o <= 1'b0;
                        if (state == READ_ACK)
                            d_data_out <= wbm_dat_i;
                    end
                end
                DONE_PLS: begin
                    done_o <= 1'b1;
                end
            endcase
        end
    end

endmodule