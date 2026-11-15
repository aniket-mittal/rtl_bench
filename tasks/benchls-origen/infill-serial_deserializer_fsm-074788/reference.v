module origen_074788 #(
    parameter DATA_LENGTH = 32,
    parameter WORD_SIZE = 8
)(
    input wire data_in,
    input wire clock,
    input wire reset,
    input wire start,
    output reg [WORD_SIZE-1:0] data_out,
    output wire RCO,
    output wire busy
);

    localparam START_BIT = 1'b1;
    localparam COUNTER_SIZE = $clog2(WORD_SIZE);
    localparam DATA_COUNTER_SIZE = $clog2(DATA_LENGTH);

    reg [WORD_SIZE-1:0] data;
    reg [COUNTER_SIZE-1:0] counter;
    reg [DATA_COUNTER_SIZE-1:0] data_counter;
    reg [3:0] ps, ns;

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            ps <= 4'b0000;
            data <= 8'hC9;
            counter <= 0;
            data_counter <= 0;
        end else begin
            ps <= ns;
            if (ps == 4'b0010) begin
                data <= {data[WORD_SIZE-2:0], data_in};
                counter <= (counter == WORD_SIZE - 1) ? 0 : counter + 1;
                data_counter <= data_counter + 1;
            end
        end
    end

    always @(*) begin
        case (ps)
            4'b0000: ns = start ? 4'b0001 : 4'b0000;
            4'b0001: ns = (data_in == START_BIT) ? 4'b0010 : 4'b0001;
            4'b0010: ns = (data_counter == DATA_LENGTH - 1) ? 4'b0000 : 4'b0010;
            default: ns = 4'b0000;
        endcase
    end

    assign RCO = (counter == WORD_SIZE - 1);
    assign busy = (ps != 4'b0000) || start;

    always @(posedge clock) begin
        if (RCO) data_out <= data;
    end

endmodule