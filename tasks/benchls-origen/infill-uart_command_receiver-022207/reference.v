module origen_022207 #(
    parameter LEN_DATA = 8
) (
    input wire clk,
    input wire reset,
    input wire rx_done_tick,
    input wire [LEN_DATA-1:0] rx_data_in,
    input wire [LEN_DATA-1:0] alu_data_in,
    output reg tx_start,
    output reg [LEN_DATA-1:0] A,
    output reg [LEN_DATA-1:0] B,
    output reg [5:0] OPCODE,
    output wire [LEN_DATA-1:0] data_out
);

    reg [1:0] counter_in;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter_in <= 2'b00;
            A <= {LEN_DATA{1'b0}};
            B <= {LEN_DATA{1'b0}};
            OPCODE <= 6'b000000;
            tx_start <= 1'b0;
        end else if (rx_done_tick) begin
            case (counter_in)
                2'b00: begin
                    A <= rx_data_in;
                    counter_in <= 2'b01;
                end
                2'b01: begin
                    B <= rx_data_in;
                    counter_in <= 2'b10;
                end
                2'b10: begin
                    OPCODE <= rx_data_in[5:0];
                    counter_in <= 2'b11;
                end
                2'b11: begin
                    counter_in <= 2'b00;
                    tx_start <= 1'b1;
                end
            endcase
        end else begin
            tx_start <= 1'b0;
        end
    end

    assign data_out = alu_data_in;

endmodule