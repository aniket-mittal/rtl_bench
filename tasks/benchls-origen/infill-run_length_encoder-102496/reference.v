module origen_102496 (
    input wire rst,
    input wire clk,
    input wire in_valid,
    input wire [255:0] in_data,
    output reg out_valid,
    output reg [255:0] out_data
);

    reg [63:0] ctr_repeat;
    reg [63:0] ctr_entries;
    reg [255:0] prev_wr_data;
    reg prev_wr_same;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            ctr_repeat <= 64'd0;
            ctr_entries <= 64'd0;
            prev_wr_data <= 256'd0;
            prev_wr_same <= 1'b0;
            out_valid <= 1'b0;
            out_data <= 256'd0;
        end else begin
            if (in_valid) begin
                if (prev_wr_same) begin
                    if (in_data == prev_wr_data) begin
                        ctr_repeat <= ctr_repeat + 1;
                        out_valid <= 1'b0;
                        out_data <= 256'd0;
                    end else begin
                        out_valid <= 1'b1;
                        out_data <= {128'd0, ctr_entries, ctr_repeat};
                        ctr_entries <= 64'd0;
                        ctr_repeat <= 64'd1;
                    end
                end else begin
                    out_valid <= 1'b1;
                    out_data <= prev_wr_data;
                    ctr_entries <= ctr_entries + 1;
                    ctr_repeat <= 64'd0;
                end
                prev_wr_data <= in_data;
                prev_wr_same <= (in_data == prev_wr_data);
            end else begin
                out_valid <= 1'b0;
                out_data <= 256'd0;
            end
        end
    end

endmodule