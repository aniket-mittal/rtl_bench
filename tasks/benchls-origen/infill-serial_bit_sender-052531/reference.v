module origen_052531 (
    input [7:0] data_in,
    input sr_clk,
    input ar,
    output reg ser_out
);

    reg [1:0] state, next_state;
    reg [2:0] sr_count;
    reg [7:0] out_data;

    parameter RESET = 2'b00;
    parameter SEND_ONE = 2'b01;
    parameter SEND_DATA = 2'b10;

    always @(posedge sr_clk or negedge ar) begin
        if (!ar) begin
            out_data <= 8'b0;
        end else begin
            out_data <= data_in;
        end
    end

    always @(negedge sr_clk or negedge ar) begin
        if (!ar) begin
            state <= RESET;
            sr_count <= 3'b000;
        end else begin
            state <= next_state;
            sr_count <= (sr_count == 3'b111) ? 3'b000 : sr_count + 1'b1;
        end
    end

    always @(*) begin
        case (state)
            RESET: begin
                ser_out = 1'b0;
                next_state = (sr_count == 3'b111) ? SEND_ONE : RESET;
            end
            SEND_ONE: begin
                ser_out = 1'b1;
                next_state = (sr_count == 3'b111) ? SEND_DATA : SEND_ONE;
            end
            SEND_DATA: begin
                ser_out = out_data[sr_count];
                next_state = (sr_count == 3'b111) ? RESET : SEND_DATA;
            end
            default: begin
                ser_out = 1'b0;
                next_state = RESET;
            end
        endcase
    end

endmodule