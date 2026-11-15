// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01359 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[32:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h0db8547fec;
    stim[1] = 37'h10d81738e1;
    stim[2] = 37'h0e0ed4194a;
    stim[3] = 37'h12c6db3d14;
    stim[4] = 37'h1b58a60f47;
    stim[5] = 37'h0e48aa3338;
    stim[6] = 37'h1bc3397c28;
    stim[7] = 37'h1e97955b56;
    stim[8] = 37'h03b14b7e08;
    stim[9] = 37'h179764926c;
    stim[10] = 37'h0ba711eb7d;
    stim[11] = 37'h1b341674ae;
    stim[12] = 37'h164116dbae;
    stim[13] = 37'h036cfefa26;
    stim[14] = 37'h0758bedc63;
    stim[15] = 37'h1ed562db8c;
    stim[16] = 37'h1af969ebdb;
    stim[17] = 37'h0a7506add4;
    stim[18] = 37'h06a643d19b;
    stim[19] = 37'h0fafe9e858;
    stim[20] = 37'h0a9f6fd86d;
    stim[21] = 37'h0a072746f8;
    stim[22] = 37'h0e2db33d1f;
    stim[23] = 37'h0e2d88426a;
    stim[24] = 37'h0ebb60d1c0;
    stim[25] = 37'h1f93a5bc7a;
    stim[26] = 37'h0aa1687f55;
    stim[27] = 37'h0f4baac4de;
    stim[28] = 37'h1b77eb5f41;
    stim[29] = 37'h0658710a6d;
    stim[30] = 37'h1ffaf4b1d4;
    stim[31] = 37'h0a9c8f2a74;
    stim[32] = 37'h17841a1f17;
    stim[33] = 37'h073c34ad62;
    stim[34] = 37'h1e227b21dd;
    stim[35] = 37'h0238789aca;
    stim[36] = 37'h0b3e8bb447;
    stim[37] = 37'h1a6d24a068;
    stim[38] = 37'h0a6e56cac6;
    stim[39] = 37'h03e1388f4b;
    stim[40] = 37'h179bf477a1;
    stim[41] = 37'h0b75738f41;
    stim[42] = 37'h13f8fd45f7;
    stim[43] = 37'h0bd878b632;
    stim[44] = 37'h03893ad0bf;
    stim[45] = 37'h03efda648d;
    stim[46] = 37'h0284766a02;
    stim[47] = 37'h1b5e568baf;
    stim[48] = 37'h1302982080;
    stim[49] = 37'h160b60f2da;
    stim[50] = 37'h165850fb05;
    stim[51] = 37'h0fe79b22eb;
    stim[52] = 37'h1ecf9cd5d0;
    stim[53] = 37'h0698f19349;
    stim[54] = 37'h0baf96cd66;
    stim[55] = 37'h12ad458d96;
    stim[56] = 37'h137be0b235;
    stim[57] = 37'h0ec46d3620;
    stim[58] = 37'h0657dafc26;
    stim[59] = 37'h02b4b9fbe3;
    stim[60] = 37'h078fd38869;
    stim[61] = 37'h13dc6192ae;
    stim[62] = 37'h0615bd5c9c;
    stim[63] = 37'h0f88334ba1;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h100000000;
      expv[20] = 33'h100000000;
      expv[21] = 33'h100000000;
      expv[22] = 33'h100000000;
      expv[23] = 33'h100000000;
      expv[24] = 33'h100000000;
      expv[25] = 33'h100000000;
      expv[26] = 33'h100000000;
      expv[27] = 33'h100000000;
      expv[28] = 33'h100000000;
      expv[29] = 33'h100000001;
      expv[30] = 33'h100000000;
      expv[31] = 33'h100000000;
      expv[32] = 33'h100000000;
      expv[33] = 33'h100000001;
      expv[34] = 33'h100000000;
      expv[35] = 33'h100000001;
      expv[36] = 33'h100000000;
      expv[37] = 33'h100000000;
      expv[38] = 33'h100000000;
      expv[39] = 33'h100000001;
      expv[40] = 33'h100000000;
      expv[41] = 33'h100000000;
      expv[42] = 33'h100000000;
      expv[43] = 33'h100000000;
      expv[44] = 33'h100000001;
      expv[45] = 33'h100000001;
      expv[46] = 33'h100000001;
      expv[47] = 33'h100000000;
      expv[48] = 33'h100000000;
      expv[49] = 33'h100000000;
      expv[50] = 33'h100000000;
      expv[51] = 33'h100000000;
      expv[52] = 33'h100000000;
      expv[53] = 33'h100000001;
      expv[54] = 33'h100000000;
      expv[55] = 33'h100000000;
      expv[56] = 33'h100000000;
      expv[57] = 33'h100000000;
      expv[58] = 33'h100000001;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000000;
      expv[63] = 33'h000000000;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
