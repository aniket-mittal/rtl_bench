module origen_038764 (
    input wire clk_4f,
    input wire clk_32f,
    input wire active_to_PS,
    input wire reset,
    output reg data_out
);

    reg [2:0] selector;

    always @(posedge clk_32f or posedge reset) begin
        if (reset) begin
            selector <= 3'b010;
            data_out <= 1'b0;
        end else begin
            case (selector)
                3'b000: begin
                    data_out <= 1'b1;
                    selector <= selector + 1;
                end
                3'b001: begin
                    data_out <= 1'b0;
                    selector <= selector + 1;
                end
                3'b010: begin
                    data_out <= 1'b1;
                    selector <= selector + 1;
                end
                3'b011: begin
                    data_out <= 1'b1;
                    selector <= selector + 1;
                end
                3'b100: begin
                    data_out <= active_to_PS ? 1'b1 : 1'b1;
                    selector <= selector + 1;
                end
                3'b101: begin
                    data_out <= active_to_PS ? 1'b1 : 1'b0;
                    selector <= selector + 1;
                end
                3'b110: begin
                    data_out <= 1'b0;
                    selector <= selector + 1;
                end
                3'b111: begin
                    data_out <= 1'b0;
                    selector <= 3'b000;
                end
            endcase
        end
    end

endmodule