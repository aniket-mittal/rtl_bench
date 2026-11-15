module autovcoder_100846 (
    iCLK,
    iRST_n,
    iBUTTON,
    write,
    writedata,
    read,
    readdata,
    drv_status_pass,
    drv_status_fail,
    drv_status_test_complete,
    c_state,
    same
);

  parameter ADDR_W = 25;
  parameter DATA_W = 16;

  input iCLK;
  input iRST_n;
  input iBUTTON;

  output write;
  output [DATA_W-1:0] writedata;
  output read;
  input [DATA_W-1:0] readdata;

  output drv_status_pass;
  output drv_status_fail;
  output drv_status_test_complete;
  output same;
  output [3:0] c_state;

  //=======================================================
  //  Signal declarations
  //=======================================================

  reg [1:0] pre_button;
  reg       trigger;
  reg [3:0] c_state;
  reg write, read;
  reg  [ADDR_W-1:0] address;
  reg  [DATA_W-1:0] writedata;
  reg  [       4:0] write_count;
  wire              max_address;
  wire              same;

  assign max_address = &address;
  assign same = readdata == writedata;

  wire [31:0] y0, y1, y2;
  wire [       7:0] z;
  wire [DATA_W-1:0] y;
  reg [31:0] cal_data, clk_cnt;

  assign y0 = cal_data + {7'b0, address};
  assign y1 = {y0[15:0], y0[31:16]} ^ cal_data;
  assign y2 = y1 + cal_data;
  assign z  = y1[7:0] + y2[7:0];
  assign y  = {y2[28:22], z[7:5], y1[10:5]};

  always @(posedge iCLK)
    if (!iRST_n) clk_cnt <= 32'b0;
    else clk_cnt <= clk_cnt + 32'b1;

  [MASKED]

  // test result
  assign drv_status_pass = (c_state == 9) ? 1 : 0;
  assign drv_status_fail = (c_state == 8) ? 1 : 0;
  assign drv_status_test_complete = drv_status_pass || drv_status_fail;

endmodule

