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
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            PRESCALER <= 32'h0;
            TIME <= 64'h0;
            IENABLE_reg <= 2'b0;
            IPEMDING_reg <= 2'b0;
            TIMECMP0 <= 64'hFFFFFFFFFFFFFFFF;
            TIMECMP1 <= 64'hFFFFFFFFFFFFFFFF;
            msip_reg <= 1'b0;
            rdata <= 32'h0;
        end else if (wr_H_rd_L) begin
            case (addr)
                4'h0: PRESCALER <= wdata;
                4'h1: TIME[31:0] <= wdata;
                4'h2: TIME[63:32] <= wdata;
                4'h3: IENABLE_reg <= wdata[1:0];
                4'h4: IPEMDING_reg <= wdata[1:0];
                4'h5: TIMECMP0[31:0] <= wdata;
                4'h6: TIMECMP0[63:32] <= wdata;
                4'h7: TIMECMP1[31:0] <= wdata;
                4'h8: TIMECMP1[63:32] <= wdata;
                4'h9: msip_reg <= wdata[0];
            endcase
        end else begin
            case (addr)
                4'h0: rdata <= PRESCALER;
                4'h1: rdata <= TIME[31:0];
                4'h2: rdata <= TIME[63:32];
                4'h3: rdata <= {30'b0, IENABLE_reg};
                4'h4: rdata <= {30'b0, IPEMDING_reg};
                4'h5: rdata <= TIMECMP0[31:0];
                4'h6: rdata <= TIMECMP0[63:32];
                4'h7: rdata <= TIMECMP1[31:0];
                4'h8: rdata <= TIMECMP1[63:32];
                4'h9: rdata <= {31'b0, msip_reg};
                default: rdata <= 32'h0;
            endcase
        end
    end

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