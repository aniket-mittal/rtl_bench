module origen_037926 #(
    parameter ADDR_WIDTH = 9
) (
    input wire wr_clk,
    input wire rd_clk,
    input wire [ADDR_WIDTH-1:0] wr_addr,
    input wire [ADDR_WIDTH-1:0] rd_addr,
    input wire [63:0] data_in,
    input wire [3:0] ctrl_in,
    input wire wr_allow,
    input wire rd_allow,
    input wire rd_sreset,
    output reg [63:0] data_out,
    output reg [3:0] ctrl_out
);

    // RAM declaration
    (* ram_style = "block" *) reg [67:0] ram [0:(2**ADDR_WIDTH)-1];

    // Write operation signals
    reg wr_allow_pipe;
    reg [ADDR_WIDTH-1:0] wr_addr_pipe;
    reg [67:0] data_pipe;

    // Read operation signals
    reg rd_allow_int;

    // RAM initialization
    integer i;
    initial begin
        for (i = 0; i < 2**ADDR_WIDTH; i = i + 1) begin
            ram[i] = 68'b0;
        end
    end

    // Write operation
    always @(posedge wr_clk) begin
        wr_allow_pipe <= wr_allow;
        wr_addr_pipe <= wr_addr;
        data_pipe <= {ctrl_in, data_in};

        if (wr_allow_pipe) begin
            ram[wr_addr_pipe] <= data_pipe;
        end
    end

    // Read operation
    always @(posedge rd_clk) begin
        rd_allow_int <= rd_allow;

        if (rd_sreset) begin
            data_out <= 64'b0;
            ctrl_out <= 4'b0;
        end else if (rd_allow_int) begin
            {ctrl_out, data_out} <= ram[rd_addr];
        end
    end

endmodule