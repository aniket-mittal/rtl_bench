module origen_077001 (
    input wire clk,
    input wire rst_n,
    input wire wr_H_rd_L,
    input wire load,
    input wire [3:0] addr,
    input wire [31:0] wdata,
    output reg [31:0] rdata,
    output wire time_interrupt,
    output reg msip_reg
);

    reg [31:0] PRESCALER;
    reg [63:0] TIME;
    reg [1:0] IENABLE_reg;
    reg [1:0] IPEMDING_reg;
    reg [63:0] TIMECMP0, TIMECMP1;
    reg [31:0] prescale_cnt;
    reg count_enable;

    // Register read/write logic
    [MASKED]

    // Timer and prescaler logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            prescale_cnt <= 32'h0;
            count_enable <= 1'b0;
            TIME <= 64'h0;
        end else begin
            if (prescale_cnt == 32'h0) begin
                prescale_cnt <= PRESCALER;
                count_enable <= 1'b1;
            end else begin
                prescale_cnt <= prescale_cnt - 1;
                count_enable <= 1'b0;
            end

            if (count_enable) begin
                TIME <= TIME + 1;
            end
        end
    end

    // Interrupt logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            IPEMDING_reg <= 2'b0;
        end else begin
            IPEMDING_reg[0] <= (TIME >= TIMECMP0) ? 1'b1 : IPEMDING_reg[0];
            IPEMDING_reg[1] <= (TIME >= TIMECMP1) ? 1'b1 : IPEMDING_reg[1];
        end
    end

    assign time_interrupt = |(IENABLE_reg & IPEMDING_reg);

endmodule