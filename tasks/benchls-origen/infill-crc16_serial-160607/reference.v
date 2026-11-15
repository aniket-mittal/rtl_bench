module origen_160607 #(
    parameter POLYNOMIAL = 16'h8005  // CRC-16 polynomial
)(
    input  wire        i_sys_clk,
    input  wire [7:0]  i_byte_in,
    input  wire        i_take,
    input  wire        i_reset,
    output reg         o_ready,
    output reg [15:0]  o_crc16
);

localparam CRC_IDLE = 2'b00;
localparam CRC_LOAD = 2'b01;
localparam CRC_NOTIFY = 2'b10;

reg [1:0] state;
reg [7:0] data_reg;
reg [3:0] bit_count;

always @(posedge i_sys_clk or negedge i_reset) begin
    if (!i_reset) begin
        state <= CRC_IDLE;
        o_crc16 <= 16'hFFFF;
        o_ready <= 1'b0;
    end
    else begin
        case (state)
            CRC_IDLE: begin
                if (i_take) begin
                    data_reg <= i_byte_in;
                    bit_count <= 4'b1000;
                    state <= CRC_LOAD;
                end
            end
            CRC_LOAD: begin
                if (bit_count == 0) begin
                    state <= CRC_NOTIFY;
                end
                else begin
                    o_crc16 <= {o_crc16[14:0], 1'b0} ^ (({16{data_reg[0]}} & POLYNOMIAL) & 16'hFFFF);
                    data_reg <= {data_reg[6:0], 1'b0};
                    bit_count <= bit_count - 1;
                end
            end
            CRC_NOTIFY: begin
                o_ready <= 1'b1;
                state <= CRC_IDLE;
            end
        endcase
    end
end

endmodule