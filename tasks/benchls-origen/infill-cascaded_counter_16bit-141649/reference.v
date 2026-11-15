module origen_141649 (
    input wire clk,
    input wire reset,
    input wire enable_1,
    input wire enable_2,
    input wire enable_3,
    output wire [15:0] count,
    output wire [3:0] overflow_count
);

reg [15:0] counter;
reg [3:0] overflow;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        counter <= 16'b0;
        overflow <= 4'b0;
    end else begin
        if (counter[3:0] == 4'b1111) begin
            counter[3:0] <= 4'b0000;
            if (enable_1) begin
                if (counter[7:4] == 4'b1111) begin
                    counter[7:4] <= 4'b0000;
                    if (enable_2) begin
                        if (counter[11:8] == 4'b1111) begin
                            counter[11:8] <= 4'b0000;
                            if (enable_3) begin
                                if (counter[15:12] == 4'b1111) begin
                                    counter[15:12] <= 4'b0000;
                                    overflow <= overflow + 1;
                                end else begin
                                    counter[15:12] <= counter[15:12] + 1;
                                end
                            end
                        end else begin
                            counter[11:8] <= counter[11:8] + 1;
                        end
                    end
                end else begin
                    counter[7:4] <= counter[7:4] + 1;
                end
            end
        end else begin
            counter[3:0] <= counter[3:0] + 1;
        end
    end
end

assign count = counter;
assign overflow_count = overflow;

endmodule