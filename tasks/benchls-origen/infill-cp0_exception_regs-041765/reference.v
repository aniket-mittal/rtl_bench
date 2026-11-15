module origen_041765 (
    input wire clk,
    input wire rst,
    input wire mfc0,
    input wire mtc0,
    input wire [31:0] pc,
    input wire [4:0] Rd,
    input wire [31:0] wdata,
    input wire exception,
    input wire eret,
    input wire [4:0] cause,
    output reg [31:0] rdata,
    output reg [31:0] exc_addr
);

    reg [31:0] cp0 [0:31];
    reg [31:0] status_temp;

    always @(*) begin
        if (mfc0)
            rdata = cp0[Rd];
        else
            rdata = 32'bz;

        if (eret)
            exc_addr = cp0[14];
        else
            exc_addr = 32'h00400004;
    end

    always @(negedge clk) begin
        if (rst) begin
            integer i;
            for (i = 0; i < 32; i = i + 1)
                cp0[i] <= 32'b0;
        end
        else begin
            if (mtc0)
                cp0[Rd] <= wdata;

            if (exception) begin
                status_temp <= cp0[12];
                if (!eret) begin
                    cp0[12] <= {cp0[12][26:0], 5'b0};
                    cp0[13] <= {27'b0, cause};
                    cp0[14] <= pc;
                end
                else begin
                    cp0[12] <= status_temp;
                end
            end
        end
    end

endmodule