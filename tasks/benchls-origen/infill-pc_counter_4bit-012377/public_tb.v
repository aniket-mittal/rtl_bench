// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_012377 dut (
    .Clk(clk),
    .Rst(in_vec[9:9]),
    .PC_INC(in_vec[8:8]),
    .PCH_INC(in_vec[7:7]),
    .PCH_IN(in_vec[6:6]),
    .PC_IN(in_vec[5:5]),
    .PC_OUT(in_vec[4:4]),
    .BUS_IN(in_vec[3:0]),
    .BUS_OUT(out_vec[11:8]),
    .C_MEM(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h2dd;
    stim[1] = 10'h293;
    stim[2] = 10'h0f2;
    stim[3] = 10'h16a;
    stim[4] = 10'h0d0;
    stim[5] = 10'h1bd;
    stim[6] = 10'h04a;
    stim[7] = 10'h1c2;
    stim[8] = 10'h076;
    stim[9] = 10'h0f5;
    stim[10] = 10'h00a;
    stim[11] = 10'h199;
    stim[12] = 10'h12c;
    stim[13] = 10'h1b5;
    stim[14] = 10'h16a;
    stim[15] = 10'h15d;
    stim[16] = 10'h163;
    stim[17] = 10'h0a9;
    stim[18] = 10'h1a3;
    stim[19] = 10'h0d3;
    stim[20] = 10'h04d;
    stim[21] = 10'h056;
    stim[22] = 10'h175;
    stim[23] = 10'h0ae;
    stim[24] = 10'h1d4;
    stim[25] = 10'h161;
    stim[26] = 10'h1dc;
    stim[27] = 10'h0e7;
    stim[28] = 10'h154;
    stim[29] = 10'h0e8;
    stim[30] = 10'h0ca;
    stim[31] = 10'h086;
    stim[32] = 10'h1a9;
    stim[33] = 10'h19f;
    stim[34] = 10'h180;
    stim[35] = 10'h0e1;
    stim[36] = 10'h005;
    stim[37] = 10'h11d;
    stim[38] = 10'h116;
    stim[39] = 10'h178;
    stim[40] = 10'h191;
    stim[41] = 10'h06b;
    stim[42] = 10'h0b3;
    stim[43] = 10'h18f;
    stim[44] = 10'h117;
    stim[45] = 10'h124;
    stim[46] = 10'h135;
    stim[47] = 10'h168;
    stim[48] = 10'h1b1;
    stim[49] = 10'h0e0;
    stim[50] = 10'h00d;
    stim[51] = 10'h079;
    stim[52] = 10'h188;
    stim[53] = 10'h15d;
    stim[54] = 10'h079;
    stim[55] = 10'h036;
    stim[56] = 10'h1e6;
    stim[57] = 10'h1f1;
    stim[58] = 10'h167;
    stim[59] = 10'h1d3;
    stim[60] = 10'h090;
    stim[61] = 10'h0ab;
    stim[62] = 10'h1c2;
    stim[63] = 10'h05f;
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
      expv[0] = 12'h000;
      expv[1] = 12'h000;
      expv[2] = 12'h000;
      expv[3] = 12'hx22;
      expv[4] = 12'haaa;
      expv[5] = 12'ha0a;
      expv[6] = 12'hx1d;
      expv[7] = 12'hxad;
      expv[8] = 12'he2e;
      expv[9] = 12'h666;
      expv[10] = 12'hx55;
      expv[11] = 12'h555;
      expv[12] = 12'hx66;
      expv[13] = 12'hc6c;
      expv[14] = 12'hx75;
      expv[15] = 12'haaa;
      expv[16] = 12'hxdb;
      expv[17] = 12'hx33;
      expv[18] = 12'hx49;
      expv[19] = 12'h353;
      expv[20] = 12'hx33;
      expv[21] = 12'h3d3;
      expv[22] = 12'h363;
      expv[23] = 12'hx55;
      expv[24] = 12'he6e;
      expv[25] = 12'hx4f;
      expv[26] = 12'h111;
      expv[27] = 12'hxc2;
      expv[28] = 12'h777;
      expv[29] = 12'hx48;
      expv[30] = 12'hx88;
      expv[31] = 12'hxa8;
      expv[32] = 12'hxb8;
      expv[33] = 12'h9c9;
      expv[34] = 12'hxda;
      expv[35] = 12'hxeb;
      expv[36] = 12'hx11;
      expv[37] = 12'h111;
      expv[38] = 12'h212;
      expv[39] = 12'h313;
      expv[40] = 12'h888;
      expv[41] = 12'hx99;
      expv[42] = 12'hbbb;
      expv[43] = 12'hxc3;
      expv[44] = 12'h4d4;
      expv[45] = 12'hxd5;
      expv[46] = 12'h4d4;
      expv[47] = 12'hxd5;
      expv[48] = 12'h888;
      expv[49] = 12'hx91;
      expv[50] = 12'hx00;
      expv[51] = 12'h000;
      expv[52] = 12'hx99;
      expv[53] = 12'haaa;
      expv[54] = 12'hbdb;
      expv[55] = 12'h999;
      expv[56] = 12'hx96;
      expv[57] = 12'h666;
      expv[58] = 12'hx11;
      expv[59] = 12'h777;
      expv[60] = 12'h838;
      expv[61] = 12'hx48;
      expv[62] = 12'hx5b;
      expv[63] = 12'hc2c;
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
