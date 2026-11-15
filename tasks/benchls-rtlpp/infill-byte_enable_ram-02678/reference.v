module rtlpp_02678(
    clk, rst,
    
    addr, en, we, datain, dataout
);

parameter dw = 32;   // Replace with the appropriate value for `OR1200_OPERAND_WIDTH
parameter aw = 9;    // Replace with the appropriate value for `OR1200_ICINDX

input               clk;
input               rst;
input   [aw-1:0]    addr;
input               en;
input   [3:0]       we;
input   [dw-1:0]    datain;
output  [dw-1:0]    dataout;

reg     [dw-1:0]    mem [(1<<aw)-1:0];
reg     [dw-1:0]    dataout_reg;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        dataout_reg <= 0;
    end else if (en && we != 4'b0000) begin
        if (we[0]) mem[addr][7:0]   <= datain[7:0];
        if (we[1]) mem[addr][15:8]  <= datain[15:8];
        if (we[2]) mem[addr][23:16] <= datain[23:16];
        if (we[3]) mem[addr][31:24] <= datain[31:24];
    end else if (en) begin
        dataout_reg <= mem[addr];
    end
end

assign dataout = dataout_reg;

endmodule