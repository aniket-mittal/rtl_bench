module origen_203010 (
    input Clk,
    input Rst_n,
    input [7:0] data_byte,
    input send_en,
    input [2:0] baud_set,
    output Rs232_Tx,
    output Tx_Done,
    output [1:0] uart_state
);

    // Baud rate divisor values
    localparam BPS_2400 = 12'd521;
    localparam BPS_4800 = 12'd260;
    localparam BPS_9600 = 12'd130;
    localparam BPS_19200 = 12'd65;
    localparam BPS_38400 = 12'd32;
    localparam BPS_57600 = 12'd21;
    localparam BPS_115200 = 12'd10;

    reg [11:0] bps_DR;
    reg [11:0] bps_cnt;
    reg [7:0] r_data_byte;
    reg [3:0] bit_pos;
    reg r_Rs232_Tx;

    wire bps_clk;

    // Baud rate selection
    always @(*) begin
        case (baud_set)
            3'b000: bps_DR = BPS_2400;
            3'b001: bps_DR = BPS_4800;
            3'b010: bps_DR = BPS_9600;
            3'b011: bps_DR = BPS_19200;
            3'b100: bps_DR = BPS_38400;
            3'b101: bps_DR = BPS_57600;
            3'b110: bps_DR = BPS_115200;
            default: bps_DR = BPS_9600;
        endcase
    end

    // Baud rate clock generation
    assign bps_clk = (bps_cnt == 12'b0) ? 1'b1 : 1'b0;
    always @(posedge Clk or negedge Rst_n) begin
        if (~Rst_n) begin
            bps_cnt <= 12'b0;
        end else begin
            bps_cnt <= (bps_cnt == bps_DR) ? 12'b0 : bps_cnt + 1'b1;
        end
    end

    // UART state management
    assign uart_state = (send_en) ? 2'b01 : ((bit_pos == 4'd11) ? 2'b00 : 2'b10);

    // Data byte capture
    always @(posedge Clk or negedge Rst_n) begin
        if (~Rst_n) begin
            r_data_byte <= 8'b0;
        end else if (send_en) begin
            r_data_byte <= data_byte;
        end
    end

    // Bit position counter
    always @(posedge bps_clk or negedge Rst_n) begin
        if (~Rst_n) begin
            bit_pos <= 4'b0;
        end else if (send_en) begin
            bit_pos <= (bit_pos == 4'd11) ? 4'b0 : bit_pos + 1'b1;
        end
    end

    // UART frame generation
    always @(posedge bps_clk or negedge Rst_n) begin
        if (~Rst_n) begin
            r_Rs232_Tx <= 1'b1;
        end else begin
            case (bit_pos)
                4'd0: r_Rs232_Tx <= 1'b0;  // Start bit
                4'd1: r_Rs232_Tx <= r_data_byte[0];
                4'd2: r_Rs232_Tx <= r_data_byte[1];
                4'd3: r_Rs232_Tx <= r_data_byte[2];
                4'd4: r_Rs232_Tx <= r_data_byte[3];
                4'd5: r_Rs232_Tx <= r_data_byte[4];
                4'd6: r_Rs232_Tx <= r_data_byte[5];
                4'd7: r_Rs232_Tx <= r_data_byte[6];
                4'd8: r_Rs232_Tx <= r_data_byte[7];
                4'd9: r_Rs232_Tx <= 1'b1;   // Stop bit
                4'd10: r_Rs232_Tx <= 1'b1;  // Stop bit
                default: r_Rs232_Tx <= 1'b1;
            endcase
        end
    end

    assign Rs232_Tx = r_Rs232_Tx;
    assign Tx_Done = (bit_pos == 4'd11);

endmodule