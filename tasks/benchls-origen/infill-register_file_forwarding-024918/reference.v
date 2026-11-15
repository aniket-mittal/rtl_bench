module origen_024918 (
    input wire clk,
    input wire reset,
    input wire [4:0] rs1_sel,
    input wire [4:0] rs2_sel,
    input wire [4:0] rd_sel,
    input wire dest_enable,
    input wire dest_long_enable,
    input wire [63:0] dest,
    output reg [63:0] rs1_data,
    output reg [63:0] rs2_data
);

    reg [63:0] rf [31:0];
    reg [4:0] reset_counter;

    always @(posedge clk) begin
        if (reset) begin
            reset_counter <= 5'b0;
            rf[reset_counter] <= 64'b0;
            reset_counter <= reset_counter + 1;
        end else begin
            // Write operation
            if (dest_enable) begin
                if (dest_long_enable) begin
                    rf[rd_sel] <= dest;
                end else begin
                    rf[rd_sel][31:0] <= dest[31:0];
                end
            end

            // Read operations with forwarding
            if (rs1_sel == rd_sel && dest_enable) begin
                if (dest_long_enable) begin
                    rs1_data <= dest;
                end else begin
                    rs1_data <= {rf[rs1_sel][63:32], dest[31:0]};
                end
            end else begin
                rs1_data <= rf[rs1_sel];
            end

            if (rs2_sel == rd_sel && dest_enable) begin
                if (dest_long_enable) begin
                    rs2_data <= dest;
                end else begin
                    rs2_data <= {rf[rs2_sel][63:32], dest[31:0]};
                end
            end else begin
                rs2_data <= rf[rs2_sel];
            end
        end
    end

endmodule