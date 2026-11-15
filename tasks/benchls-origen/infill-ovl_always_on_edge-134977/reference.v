module origen_134977 (
    input wire clk,
    input wire rst,
    input wire enable,
    input wire sampling_event,
    input wire test_expr,
    input wire prevConfigInvalid,
    output wire out
);

    // Implement the functionality of ovl_always_on_edge_wrapped
    reg out_reg;
    assign out = out_reg;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            out_reg <= 1'b0;
        end else if (enable && sampling_event) begin
            if (prevConfigInvalid) begin
                out_reg <= 1'b0;
            end else begin
                out_reg <= test_expr;
            end
        end
    end

endmodule

// Testbench
