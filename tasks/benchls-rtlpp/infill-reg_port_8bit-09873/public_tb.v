// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09873 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[39:32]),
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
    stim[0] = 37'h09534fef6b;
    stim[1] = 37'h182bdccb51;
    stim[2] = 37'h0f9f647bcd;
    stim[3] = 37'h0786a90f35;
    stim[4] = 37'h0f702f9e58;
    stim[5] = 37'h1b787f9c0d;
    stim[6] = 37'h17f3da3ec7;
    stim[7] = 37'h022af94d55;
    stim[8] = 37'h0e3ca2651b;
    stim[9] = 37'h0f0c8482ba;
    stim[10] = 37'h061446a932;
    stim[11] = 37'h13f46c8a15;
    stim[12] = 37'h1b0cb9646b;
    stim[13] = 37'h0207a02e25;
    stim[14] = 37'h03f4b5c816;
    stim[15] = 37'h02a6e301e5;
    stim[16] = 37'h07e1dd9695;
    stim[17] = 37'h0f90e934ef;
    stim[18] = 37'h1e8db8dd35;
    stim[19] = 37'h1f68247956;
    stim[20] = 37'h165c04fae4;
    stim[21] = 37'h03db5ba7da;
    stim[22] = 37'h10cf34cc77;
    stim[23] = 37'h0e98dc9ab7;
    stim[24] = 37'h0bcedcb88a;
    stim[25] = 37'h0adb2d9545;
    stim[26] = 37'h0fd47e61e8;
    stim[27] = 37'h1bc27d0d8c;
    stim[28] = 37'h066130aa49;
    stim[29] = 37'h12836d0940;
    stim[30] = 37'h0f35e530f8;
    stim[31] = 37'h1af3302a29;
    stim[32] = 37'h1a269470e7;
    stim[33] = 37'h0a9859f7fe;
    stim[34] = 37'h12408afd4f;
    stim[35] = 37'h02171baf0f;
    stim[36] = 37'h0d2811f35b;
    stim[37] = 37'h0b7cafd022;
    stim[38] = 37'h1edd24229d;
    stim[39] = 37'h025fe93aa3;
    stim[40] = 37'h0e70ce156e;
    stim[41] = 37'h16b98621c9;
    stim[42] = 37'h072520da6f;
    stim[43] = 37'h0bf605dd37;
    stim[44] = 37'h1304a3d11e;
    stim[45] = 37'h0641ac2575;
    stim[46] = 37'h1b034ff43c;
    stim[47] = 37'h1204187914;
    stim[48] = 37'h124c3e1a87;
    stim[49] = 37'h13c6bd5a99;
    stim[50] = 37'h0a20bd976f;
    stim[51] = 37'h1b055b556b;
    stim[52] = 37'h0e20d8f6a4;
    stim[53] = 37'h13affae532;
    stim[54] = 37'h12e732caa3;
    stim[55] = 37'h03548ddf90;
    stim[56] = 37'h12e8f8c0d1;
    stim[57] = 37'h17843c5c72;
    stim[58] = 37'h0f4f8f426a;
    stim[59] = 37'h0689188aaf;
    stim[60] = 37'h1e776932e5;
    stim[61] = 37'h1b59ac7722;
    stim[62] = 37'h0a4f60439d;
    stim[63] = 37'h028612e1e1;
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
      expv[0] = 40'h0000000000;
      expv[1] = 40'h0000000000;
      expv[2] = 40'h0000000000;
      expv[3] = 40'h0000000000;
      expv[4] = 40'h0000000000;
      expv[5] = 40'h0000000000;
      expv[6] = 40'h0000000000;
      expv[7] = 40'h0000000000;
      expv[8] = 40'h0000000000;
      expv[9] = 40'h0000000000;
      expv[10] = 40'h0000000000;
      expv[11] = 40'h3200000000;
      expv[12] = 40'h3200000000;
      expv[13] = 40'h3200000032;
      expv[14] = 40'h3200000032;
      expv[15] = 40'h3200000032;
      expv[16] = 40'h3200000032;
      expv[17] = 40'h3200000000;
      expv[18] = 40'h3200000000;
      expv[19] = 40'h3200000000;
      expv[20] = 40'h3200000000;
      expv[21] = 40'h3200000032;
      expv[22] = 40'h0000000000;
      expv[23] = 40'h0000000000;
      expv[24] = 40'h0000000000;
      expv[25] = 40'h0000000000;
      expv[26] = 40'h0000000000;
      expv[27] = 40'h0000000000;
      expv[28] = 40'h0000000000;
      expv[29] = 40'h4900000000;
      expv[30] = 40'h4900000000;
      expv[31] = 40'h4900000000;
      expv[32] = 40'h4900000000;
      expv[33] = 40'h4900000000;
      expv[34] = 40'h4900000000;
      expv[35] = 40'h4900000049;
      expv[36] = 40'h0000000000;
      expv[37] = 40'h0000000000;
      expv[38] = 40'h0000000000;
      expv[39] = 40'h0000000000;
      expv[40] = 40'h0000000000;
      expv[41] = 40'h0000000000;
      expv[42] = 40'h0000000000;
      expv[43] = 40'h0000000000;
      expv[44] = 40'h0000000000;
      expv[45] = 40'h0000000000;
      expv[46] = 40'h7500000000;
      expv[47] = 40'h7500000000;
      expv[48] = 40'h7500000000;
      expv[49] = 40'h7500000000;
      expv[50] = 40'h7500000000;
      expv[51] = 40'h7500000000;
      expv[52] = 40'h7500000000;
      expv[53] = 40'h7500000000;
      expv[54] = 40'h7500000000;
      expv[55] = 40'h7500000075;
      expv[56] = 40'h7500000000;
      expv[57] = 40'h7500000000;
      expv[58] = 40'h7500000000;
      expv[59] = 40'h7500000075;
      expv[60] = 40'haf00000000;
      expv[61] = 40'haf00000000;
      expv[62] = 40'haf00000000;
      expv[63] = 40'haf000000af;
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
