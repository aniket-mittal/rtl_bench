module origen_185965 #(
    parameter NUMADDR = 256,
    parameter BITADDR = 8,
    parameter BITDATA = 32,
    parameter SRAM_DELAY = 2,
    parameter RSTINIT = 0,
    parameter RSTSTRT = 0,
    parameter RSTINCR = 1,
    parameter FORMAL_FULL = 0,
    parameter FORMAL_SELECT = 0
) (
    input                   clk,
    input                   rst,
    input                   read_0,
    input [BITADDR-1:0]     rd_adr_0,
    input                   write_1,
    input [BITADDR-1:0]     wr_adr_1,
    input [BITDATA-1:0]     wr_din_1,
    input [BITADDR-1:0]     select_adr,
    output                  ready,
    output [BITDATA-1:0]    rd_dout_0
);

    reg [BITDATA-1:0] memory [0:NUMADDR-1];
    reg [BITADDR-1:0] read_delay_cnt;
    reg [BITDATA-1:0] read_data_reg;

    initial begin
        for (int i = 0; i < NUMADDR; i++) begin
            memory[i] = RSTINIT;
        end
        read_delay_cnt = RSTSTRT;
        read_data_reg = RSTINIT;
    end

    always @(posedge clk) begin
        if (rst) begin
            for (int i = 0; i < NUMADDR; i++) begin
                memory[i] <= RSTINIT + i * RSTINCR;
            end
            read_delay_cnt <= RSTSTRT;
            read_data_reg <= RSTINIT;
        end else begin
            if (write_1) begin
                memory[wr_adr_1] <= wr_din_1;
            end
            if (read_0) begin
                if (read_delay_cnt == SRAM_DELAY) begin
                    read_data_reg <= memory[rd_adr_0];
                end else begin
                    read_delay_cnt <= read_delay_cnt + 1;
                end
            end
        end
    end

    assign ready = (read_delay_cnt == SRAM_DELAY);
    assign rd_dout_0 = read_data_reg;

    `ifdef FORMAL_FULL
        reg [BITDATA-1:0] formal_memory [0:NUMADDR-1];

        initial begin
            for (int i = 0; i < NUMADDR; i++) begin
                formal_memory[i] = RSTINIT + i * RSTINCR;
            end
        end

        always @(posedge clk) begin
            if (rst) begin
                for (int i = 0; i < NUMADDR; i++) begin
                    formal_memory[i] <= RSTINIT + i * RSTINCR;
                end
            end else begin
                if (write_1) begin
                    formal_memory[wr_adr_1] <= wr_din_1;
                end
                if (read_0) begin
                    assert(formal_memory[rd_adr_0] == read_data_reg);
                end
            end
        end
    `elsif FORMAL_SELECT
        reg [BITDATA-1:0] formal_memory;

        initial begin
            formal_memory = RSTINIT;
        end

        always @(posedge clk) begin
            if (rst) begin
                formal_memory <= RSTINIT;
            end else begin
                if (write_1 && select_adr == wr_adr_1) begin
                    formal_memory <= wr_din_1;
                end
                if (read_0 && select_adr == rd_adr_0) begin
                    assert(formal_memory == read_data_reg);
                end
            end
        end
    `endif

endmodule