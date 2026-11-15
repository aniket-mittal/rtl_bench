module origen_197108(
    input clk,
    input rst_n,
    input data_in,
    input data_in_valid,
    output reg [15:0] data_out,
    output reg data_out_valid
);

reg [15:0] ff;
wire [15:0] next_ff;

// CRC polynomial: x^16 + x^12 + x^5 + 1
assign next_ff = {ff[14:0], data_in} ^ (ff[15] ? 16'h8005 : 16'h0000);

reg [1:0] state;
parameter INIT = 2'b00, WAIT = 2'b01, CALC = 2'b10;

reg [3:0] out_ptr;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= INIT;
        ff <= 16'hFFFF;
        out_ptr <= 4'b0;
        data_out <= 16'b0;
        data_out_valid <= 1'b0;
    end
    else begin
        case (state)
            INIT: begin
                ff <= 16'hFFFF;
                state <= WAIT;
            end
            WAIT: begin
                if (data_in_valid) begin
                    state <= CALC;
                end
            end
            CALC: begin
                ff <= next_ff;
                data_out <= ~ff[out_ptr];
                data_out_valid <= 1'b1;
                out_ptr <= out_ptr + 1'b1;
                if (out_ptr == 4'b1111) begin
                    state <= INIT;
                    data_out_valid <= 1'b0;
                end
            end
            default: state <= INIT;
        endcase
    end
end

endmodule