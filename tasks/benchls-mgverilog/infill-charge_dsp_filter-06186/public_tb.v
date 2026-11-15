// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 39;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06186 dut (
    .clk(clk),
    .charge_in(in_vec[38:18]),
    .signal_in(in_vec[17:3]),
    .delay_en(in_vec[2:2]),
    .store_strb(in_vec[1:1]),
    .bunch_strb(in_vec[0:0]),
    .DSPout(out_vec[12:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 39'h04381f7a54;
    stim[1] = 39'h33a0785b7d;
    stim[2] = 39'h3e366ae495;
    stim[3] = 39'h2fd11e8e2b;
    stim[4] = 39'h449a72e474;
    stim[5] = 39'h7cf91e13c7;
    stim[6] = 39'h58cdd6b05f;
    stim[7] = 39'h2fe803d119;
    stim[8] = 39'h2cbec7889b;
    stim[9] = 39'h0f49fefe05;
    stim[10] = 39'h1de9486878;
    stim[11] = 39'h07e255216b;
    stim[12] = 39'h15a5bee09d;
    stim[13] = 39'h308fd3c3e7;
    stim[14] = 39'h128abbb4f3;
    stim[15] = 39'h7d36805363;
    stim[16] = 39'h0590c6aecf;
    stim[17] = 39'h7a4845eb26;
    stim[18] = 39'h699394db00;
    stim[19] = 39'h0cefdbd7e1;
    stim[20] = 39'h73ba0e96b4;
    stim[21] = 39'h6bcacba68b;
    stim[22] = 39'h0889ff4da0;
    stim[23] = 39'h5da842167f;
    stim[24] = 39'h47cbfc6f20;
    stim[25] = 39'h7cef889902;
    stim[26] = 39'h4bcfe3006f;
    stim[27] = 39'h1c847a0f56;
    stim[28] = 39'h4f5a7ab5af;
    stim[29] = 39'h71a8b199a6;
    stim[30] = 39'h3b11158c5a;
    stim[31] = 39'h4097073d1e;
    stim[32] = 39'h2930c70067;
    stim[33] = 39'h1b5214d592;
    stim[34] = 39'h023408184e;
    stim[35] = 39'h0fd4edd6d2;
    stim[36] = 39'h20726950b7;
    stim[37] = 39'h0d33349e0c;
    stim[38] = 39'h5e3f89f3e3;
    stim[39] = 39'h4d3f3a75d3;
    stim[40] = 39'h5130e895fc;
    stim[41] = 39'h127bba8e19;
    stim[42] = 39'h76ca503d83;
    stim[43] = 39'h664cacac57;
    stim[44] = 39'h4ed602c25a;
    stim[45] = 39'h08bbb11bdc;
    stim[46] = 39'h6bd1cbd173;
    stim[47] = 39'h2e78a061ac;
    stim[48] = 39'h727b48d518;
    stim[49] = 39'h232bdc314e;
    stim[50] = 39'h54afbcc340;
    stim[51] = 39'h3110fd9450;
    stim[52] = 39'h6b728278a7;
    stim[53] = 39'h44b4759ba1;
    stim[54] = 39'h648dc70e9f;
    stim[55] = 39'h3f7a130520;
    stim[56] = 39'h640fc14de4;
    stim[57] = 39'h3d8999211b;
    stim[58] = 39'h5e9361d7e4;
    stim[59] = 39'h65baed1b1b;
    stim[60] = 39'h59f7f75f7a;
    stim[61] = 39'h6561f49dcd;
    stim[62] = 39'h593cae6ec4;
    stim[63] = 39'h51214256b2;
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
      expv[0] = 13'h0000;
      expv[1] = 13'hxxxx;
      expv[2] = 13'hxxxx;
      expv[3] = 13'hxxxx;
      expv[4] = 13'hxxxx;
      expv[5] = 13'hxxxx;
      expv[6] = 13'h05f9;
      expv[7] = 13'h191e;
      expv[8] = 13'h0f51;
      expv[9] = 13'h159f;
      expv[10] = 13'h0557;
      expv[11] = 13'h08ff;
      expv[12] = 13'h0b4f;
      expv[13] = 13'h1c72;
      expv[14] = 13'h1092;
      expv[15] = 13'h0bb8;
      expv[16] = 13'h1a65;
      expv[17] = 13'h14da;
      expv[18] = 13'h1933;
      expv[19] = 13'h0c1c;
      expv[20] = 13'h0819;
      expv[21] = 13'h0bcf;
      expv[22] = 13'h159b;
      expv[23] = 13'h03f1;
      expv[24] = 13'h089f;
      expv[25] = 13'h1c74;
      expv[26] = 13'h093d;
      expv[27] = 13'h07fc;
      expv[28] = 13'h066d;
      expv[29] = 13'h1262;
      expv[30] = 13'h0d35;
      expv[31] = 13'h1d90;
      expv[32] = 13'h1572;
      expv[33] = 13'h15de;
      expv[34] = 13'h1042;
      expv[35] = 13'h13fb;
      expv[36] = 13'h195c;
      expv[37] = 13'h18f5;
      expv[38] = 13'h0f57;
      expv[39] = 13'h1ac7;
      expv[40] = 13'h141c;
      expv[41] = 13'h0ee3;
      expv[42] = 13'h163b;
      expv[43] = 13'h1301;
      expv[44] = 13'h0c26;
      expv[45] = 13'h131b;
      expv[46] = 13'h0a0f;
      expv[47] = 13'h0575;
      expv[48] = 13'h04cd;
      expv[49] = 13'h19bd;
      expv[50] = 13'h00a2;
      expv[51] = 13'h176c;
      expv[52] = 13'h15d4;
      expv[53] = 13'h1d19;
      expv[54] = 13'h1fa7;
      expv[55] = 13'h02a4;
      expv[56] = 13'h1b84;
      expv[57] = 13'h1f11;
      expv[58] = 13'h15e9;
      expv[59] = 13'h1453;
      expv[60] = 13'h10d8;
      expv[61] = 13'h05a0;
      expv[62] = 13'h0805;
      expv[63] = 13'h1f0c;
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
