module origen_207502(
    input clock,
    input reset,
    input [1:0] data_input,
    output reg [1:0] state
);

always @(posedge clock or negedge reset) begin
    if (~reset) begin
        state <= 2'b00;
    end
    else begin
        case (state)
            2'b00: begin
                case (data_input)
                    2'b00: state <= 2'b00;
                    2'b01: state <= 2'b01;
                    2'b10: state <= 2'b11;
                    2'b11: state <= 2'b10;
                endcase
            end
            2'b01: begin
                case (data_input)
                    2'b00: state <= 2'b01;
                    2'b01: state <= 2'b11;
                    2'b10: state <= 2'b10;
                    2'b11: state <= 2'b00;
                endcase
            end
            2'b11: begin
                case (data_input)
                    2'b00: state <= 2'b11;
                    2'b01: state <= 2'b10;
                    2'b10: state <= 2'b00;
                    2'b11: state <= 2'b01;
                endcase
            end
            2'b10: begin
                case (data_input)
                    2'b00: state <= 2'b10;
                    2'b01: state <= 2'b00;
                    2'b10: state <= 2'b01;
                    2'b11: state <= 2'b11;
                endcase
            end
        endcase
    end
end

endmodule