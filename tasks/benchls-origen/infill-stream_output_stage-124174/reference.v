module origen_124174 (
    input wire clock,
    input wire reset,
    input wire internal_output_is_valid,
    input wire ena,
    input wire ready_out,
    output reg stall,
    output reg valid_out,
    output reg [7:0] data_out,
    output reg eop_out,
    output reg sop_out
);

    reg [7:0] data_reg;
    reg eop_reg;
    reg sop_reg;
    reg valid_reg;

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            stall <= 1'b0;
            valid_out <= 1'b0;
            data_out <= 8'b0;
            eop_out <= 1'b0;
            sop_out <= 1'b0;
            data_reg <= 8'b0;
            eop_reg <= 1'b0;
            sop_reg <= 1'b0;
            valid_reg <= 1'b0;
        end else begin
            // Stall logic
            stall <= ~ready_out;

            // Valid output logic
            valid_reg <= internal_output_is_valid & ena;
            valid_out <= valid_reg & ready_out;

            // Data, EOP, and SOP holding logic
            if (ready_out && valid_reg) begin
                data_out <= data_reg;
                eop_out <= eop_reg;
                sop_out <= sop_reg;
            end

            // Register internal flow controlled signals
            if (ena && internal_output_is_valid) begin
                data_reg <= data_out;
                eop_reg <= eop_out;
                sop_reg <= sop_out;
            end
        end
    end

endmodule