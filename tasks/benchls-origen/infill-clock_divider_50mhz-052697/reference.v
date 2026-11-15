module origen_052697 (
    input wire clk_50MHz,
    input wire rst,
    output reg clk_1MHz,
    output reg clk_1kHz,
    output reg clk_500Hz
);

    // Parameters for frequency division
    localparam N0 = 50;
    localparam N1 = 50000;
    localparam N2 = 100000;

    // 32-bit counters
    reg [31:0] count0, count1, count2;

    always @(posedge clk_50MHz or negedge rst) begin
        if (!rst) begin
            // Reset all counters and outputs
            count0 <= 32'b0;
            count1 <= 32'b0;
            count2 <= 32'b0;
            clk_1MHz <= 1'b0;
            clk_1kHz <= 1'b0;
            clk_500Hz <= 1'b0;
        end else begin
            // 1MHz clock generation
            if (count0 == (N0/2) - 1) begin
                count0 <= 32'b0;
                clk_1MHz <= ~clk_1MHz;
            end else begin
                count0 <= count0 + 1;
            end

            // 1kHz clock generation
            if (count1 == (N1/2) - 1) begin
                count1 <= 32'b0;
                clk_1kHz <= ~clk_1kHz;
            end else begin
                count1 <= count1 + 1;
            end

            // 500Hz clock generation
            if (count2 == (N2/2) - 1) begin
                count2 <= 32'b0;
                clk_500Hz <= ~clk_500Hz;
            end else begin
                count2 <= count2 + 1;
            end
        end
    end

endmodule