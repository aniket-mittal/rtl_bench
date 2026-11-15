module icache_tag_ram
(
    // Inputs
     input           clk_i
    ,input           rst_i
    ,input  [  7:0]  addr_i
    ,input  [ 19:0]  data_i
    ,input           wr_i

    // Outputs
    ,output [ 19:0]  data_o
);




//-----------------------------------------------------------------
// Single Port RAM 0KB
// Mode: Read First
//-----------------------------------------------------------------
reg [19:0]   ram [255:0] /*verilator public*/;
reg [19:0]   ram_read_q;

// Synchronous write
always @ (posedge clk_i)
begin
    if (wr_i)
        ram[addr_i] <= data_i;
    ram_read_q <= ram[addr_i];
end

assign data_o = ram_read_q;



endmodule