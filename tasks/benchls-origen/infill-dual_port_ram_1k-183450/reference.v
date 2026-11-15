module origen_183450 #(
    parameter INIT = 0,
    parameter PORT_R_WIDTH = 16,
    parameter PORT_W_WIDTH = 16,
    parameter CLK_CLK_POL = 1,
    parameter PORT_R_CLK_POL = 1,
    parameter PORT_W_CLK_POL = 1,
    parameter OPTION_WCLK = "POS",
    parameter OPTION_RCLK = "POS"
) (
    input CLK_CLK,
    input PORT_R_CLK,
    input [9:0] PORT_R_ADDR,
    output [PORT_R_WIDTH-1:0] PORT_R_RD_DATA,
    input PORT_W_CLK,
    input PORT_W_WR_EN,
    input [9:0] PORT_W_ADDR,
    input [PORT_W_WIDTH-1:0] PORT_W_WR_DATA
);

    reg [PORT_R_WIDTH-1:0] mem [1023:0];
    reg [PORT_R_WIDTH-1:0] rd_data_reg;

    initial begin
        for (int i = 0; i < 1024; i++) begin
            mem[i] = INIT;
        end
    end

    always @(posedge PORT_R_CLK) begin
        if (OPTION_RCLK == "POS") begin
            rd_data_reg <= mem[PORT_R_ADDR];
        end
        else if (OPTION_RCLK == "NEG") begin
            rd_data_reg <= mem[PORT_R_ADDR];
        end
    end

    always @(posedge PORT_W_CLK) begin
        if (OPTION_WCLK == "POS") begin
            if (PORT_W_WR_EN) begin
                mem[PORT_W_ADDR] <= PORT_W_WR_DATA;
            end
        end
        else if (OPTION_WCLK == "NEG") begin
            if (PORT_W_WR_EN) begin
                mem[PORT_W_ADDR] <= PORT_W_WR_DATA;
            end
        end
    end

    assign PORT_R_RD_DATA = rd_data_reg;

endmodule