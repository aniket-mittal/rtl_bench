module autovcoder_005397 (
    // Inputs
    pclk,
    mem_addr_add,
    mem_write_add,
    mem_write_data_add,
    mem_addr_age,
    mem_write_age,
    mem_write_data_age,

    mem_read_data_add,
    mem_read_data_age
);

  parameter DW = 83;  // width of data busses
  parameter DD = 256;  // depth of RAM

  input pclk;  // APB clock                           
  input [7:0] mem_addr_add;  // hash address for R/W to memory     
  input mem_write_add;  // R/W flag (write = high)            
  input [DW-1:0] mem_write_data_add;  // write data for memory             
  input [7:0] mem_addr_age;  // hash address for R/W to memory     
  input mem_write_age;  // R/W flag (write = high)            
  input [DW-1:0] mem_write_data_age;  // write data for memory             

  output [DW-1:0] mem_read_data_add;  // read data from mem                 
  output [DW-1:0] mem_read_data_age;  // read data from mem  

  reg [DW-1:0] mem_core_array[DD-1:0];  // memory array               

  reg [DW-1:0] mem_read_data_add;  // read data from mem                 
  reg [DW-1:0] mem_read_data_age;  // read data from mem  


  // -----------------------------------------------------------------------------
  //   read and write control for address checker access
  // -----------------------------------------------------------------------------
  always @(posedge pclk) begin
    if (~mem_write_add)  // read array
      mem_read_data_add <= mem_core_array[mem_addr_add];
    else mem_core_array[mem_addr_add] <= mem_write_data_add;
  end

  // -----------------------------------------------------------------------------
  //   read and write control for age checker access
  // -----------------------------------------------------------------------------
  always @(posedge pclk) begin
    if (~mem_write_age)  // read array
      mem_read_data_age <= mem_core_array[mem_addr_age];
    else mem_core_array[mem_addr_age] <= mem_write_data_age;
  end


endmodule

