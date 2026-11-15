module autovcoder_025341 (
    clk,
    rst_n,

    mem_addr,
    mem_wr,
    mem_byte_en,
    mem_req,
    mem_wr_data,
    mem_rd_data,
    mem_rdy,
    core_mem_addr,
    core_mem_addr_vld,
    core_mwr_mrd,

    d_mhaddr,
    d_mhtrans,
    d_mhwrite,
    d_mhwdata,
    d_mhsize,
    d_mhburst,
    d_mhprot,
    d_mhmasterlock,
    d_mhrdata,
    d_mhready,
    d_mhresp
);


  //-----------------------------------------------------------//
  //                      INPUTS, OUTPUTS                      //
  //-----------------------------------------------------------//
  input clk;
  input rst_n;

  input [31:0] mem_addr;
  input mem_wr;
  input [1:0] mem_byte_en;
  input mem_req;
  input [31:0] mem_wr_data;
  output [31:0] mem_rd_data;
  output mem_rdy;
  output [31:0] core_mem_addr;
  output core_mem_addr_vld;
  output core_mwr_mrd;

  output [31:0] d_mhaddr;
  output [1:0] d_mhtrans;
  output d_mhwrite;
  output [31:0] d_mhwdata;
  output [2:0] d_mhsize;
  output [2:0] d_mhburst;
  output [3:0] d_mhprot;
  output d_mhmasterlock;
  input [31:0] d_mhrdata;
  input d_mhready;
  input d_mhresp;


  //-----------------------------------------------------------//
  //                    REGISTERS & WIRES                      //
  //-----------------------------------------------------------//

  wire [31:0] mem_rd_data;
  wire        mem_rdy;

  wire [31:0] d_mhaddr;
  wire [ 2:0] d_mhburst;
  wire        d_mhmasterlock;
  wire [ 3:0] d_mhprot;
  wire [ 2:0] d_mhsize;
  wire [ 1:0] d_mhtrans;
  reg  [31:0] d_mhwdata;
  wire        d_mhwrite;

  wire [ 1:0] tmp_byte_en;

  //-----------------------------------------------------------//
  //                          PARAMETERS                       //
  //-----------------------------------------------------------//
  parameter NOSEQ = 2'b10;
  parameter IDLE = 2'b00;


  //-----------------------------------------------------------//
  //                          ARCHITECTURE                     //
  //-----------------------------------------------------------//

  //---------------
  //For debugger
  //---------------
  assign   core_mem_addr = (mem_byte_en == 2'b00)? {mem_addr} :
                         ((mem_byte_en == 2'b01)? {mem_addr[31:1], 1'b0} : {mem_addr[31:2], 2'b0});
  assign core_mem_addr_vld = mem_req;
  assign core_mwr_mrd = mem_wr;

  //---------------
  //To BUS
  //---------------
  assign d_mhaddr = mem_addr;

  assign d_mhburst = 3'b000;

  assign d_mhmasterlock = 1'b0;

  assign d_mhprot = 4'b0001;

  assign d_mhsize = {1'b0, mem_byte_en};

  assign d_mhtrans = (mem_req == 1'b1) ? NOSEQ : IDLE;


  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) d_mhwdata <= 32'b0;
    else if (d_mhready && mem_req) d_mhwdata <= mem_wr_data;
  end

  assign d_mhwrite   = mem_wr;

  assign mem_rdy     = d_mhready;

  assign mem_rd_data = d_mhrdata;


endmodule

