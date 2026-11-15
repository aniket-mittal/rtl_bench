module origen_074452 #(
    parameter N = 11
)(
    input wire clk,
    input wire n_reset,
    input wire button_in,
    output reg DB_out
);

    reg [N-1:0] q_reg, q_next;
    reg DFF1, DFF2;
    wire q_add;
    wire q_reset;

    // Two-stage synchronizer
    always @(posedge clk or negedge n_reset) begin
        if (!n_reset) begin
            DFF1 <= 1'b0;
            DFF2 <= 1'b0;
        end else begin
            DFF1 <= button_in;
            DFF2 <= DFF1;
        end
    end

    // Counter control logic
    assign q_reset = (DFF1 ^ DFF2);
    assign q_add = ~(q_reg == {N{1'b1}});

    // Counter state transition
    always @(*) begin
        case ({q_reset, q_add})
            2'b00: q_next = q_reg;
            2'b01: q_next = q_reg + 1'b1;
            default: q_next = {N{1'b0}};
        endcase
    end

    // Counter register
    always @(posedge clk or negedge n_reset) begin
        if (!n_reset)
            q_reg <= {N{1'b0}};
        else
            q_reg <= q_next;
    end

    // Output logic
    always @(posedge clk or negedge n_reset) begin
        if (!n_reset)
            DB_out <= 1'b0;
        else if (q_reg == {N{1'b1}})
            DB_out <= DFF2;
    end

endmodule