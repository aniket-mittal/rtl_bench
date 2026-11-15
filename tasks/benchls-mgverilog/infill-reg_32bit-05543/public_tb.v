// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05543 dut (
    .CLK(clk),
    .Din(in_vec[31:0]),
    .Dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'ha3f9876d;
    stim[1] = 32'h1e59f401;
    stim[2] = 32'hb4ba7864;
    stim[3] = 32'h8c2f1559;
    stim[4] = 32'h18a939fb;
    stim[5] = 32'h34ef8feb;
    stim[6] = 32'hf143c97a;
    stim[7] = 32'he52a5eb2;
    stim[8] = 32'hf9b02dc2;
    stim[9] = 32'hbcdb48d7;
    stim[10] = 32'h30becb57;
    stim[11] = 32'hcf45ff20;
    stim[12] = 32'h7465607f;
    stim[13] = 32'h102c6754;
    stim[14] = 32'h7fee6e3e;
    stim[15] = 32'hfe274ede;
    stim[16] = 32'hcf034d0f;
    stim[17] = 32'hc9f3d452;
    stim[18] = 32'h3044a88a;
    stim[19] = 32'hb37bf69e;
    stim[20] = 32'h356db477;
    stim[21] = 32'heb109f90;
    stim[22] = 32'h5006c3b0;
    stim[23] = 32'h3098691d;
    stim[24] = 32'h1e8650ed;
    stim[25] = 32'hd782e353;
    stim[26] = 32'hebc12b70;
    stim[27] = 32'h9fa69275;
    stim[28] = 32'h96c04691;
    stim[29] = 32'h56235b52;
    stim[30] = 32'h43edc031;
    stim[31] = 32'h8f2605ad;
    stim[32] = 32'h2cba2630;
    stim[33] = 32'h326881c9;
    stim[34] = 32'he11eddf7;
    stim[35] = 32'h5f95dcde;
    stim[36] = 32'hd5c6e943;
    stim[37] = 32'h899b7af0;
    stim[38] = 32'h73e65286;
    stim[39] = 32'h38d3ca14;
    stim[40] = 32'h88ca8062;
    stim[41] = 32'h324a3c9f;
    stim[42] = 32'hc33a33e7;
    stim[43] = 32'hf73ddf8b;
    stim[44] = 32'hf9c99a49;
    stim[45] = 32'hfc369047;
    stim[46] = 32'hfead2bda;
    stim[47] = 32'hcedb9ebf;
    stim[48] = 32'hc8377019;
    stim[49] = 32'he569f57b;
    stim[50] = 32'h3674bed5;
    stim[51] = 32'h5de841eb;
    stim[52] = 32'h2d369f12;
    stim[53] = 32'h754180e8;
    stim[54] = 32'hd4a724de;
    stim[55] = 32'hfd375b18;
    stim[56] = 32'h5eec02c7;
    stim[57] = 32'h66556c23;
    stim[58] = 32'h1f90b5a7;
    stim[59] = 32'hb14a3f31;
    stim[60] = 32'ha4a3c225;
    stim[61] = 32'h229d93c4;
    stim[62] = 32'h48c42c28;
    stim[63] = 32'he8c2a2d8;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'ha3f9876d;
      expv[2] = 32'h1e59f401;
      expv[3] = 32'hb4ba7864;
      expv[4] = 32'h8c2f1559;
      expv[5] = 32'h18a939fb;
      expv[6] = 32'h34ef8feb;
      expv[7] = 32'hf143c97a;
      expv[8] = 32'he52a5eb2;
      expv[9] = 32'hf9b02dc2;
      expv[10] = 32'hbcdb48d7;
      expv[11] = 32'h30becb57;
      expv[12] = 32'hcf45ff20;
      expv[13] = 32'h7465607f;
      expv[14] = 32'h102c6754;
      expv[15] = 32'h7fee6e3e;
      expv[16] = 32'hfe274ede;
      expv[17] = 32'hcf034d0f;
      expv[18] = 32'hc9f3d452;
      expv[19] = 32'h3044a88a;
      expv[20] = 32'hb37bf69e;
      expv[21] = 32'h356db477;
      expv[22] = 32'heb109f90;
      expv[23] = 32'h5006c3b0;
      expv[24] = 32'h3098691d;
      expv[25] = 32'h1e8650ed;
      expv[26] = 32'hd782e353;
      expv[27] = 32'hebc12b70;
      expv[28] = 32'h9fa69275;
      expv[29] = 32'h96c04691;
      expv[30] = 32'h56235b52;
      expv[31] = 32'h43edc031;
      expv[32] = 32'h8f2605ad;
      expv[33] = 32'h2cba2630;
      expv[34] = 32'h326881c9;
      expv[35] = 32'he11eddf7;
      expv[36] = 32'h5f95dcde;
      expv[37] = 32'hd5c6e943;
      expv[38] = 32'h899b7af0;
      expv[39] = 32'h73e65286;
      expv[40] = 32'h38d3ca14;
      expv[41] = 32'h88ca8062;
      expv[42] = 32'h324a3c9f;
      expv[43] = 32'hc33a33e7;
      expv[44] = 32'hf73ddf8b;
      expv[45] = 32'hf9c99a49;
      expv[46] = 32'hfc369047;
      expv[47] = 32'hfead2bda;
      expv[48] = 32'hcedb9ebf;
      expv[49] = 32'hc8377019;
      expv[50] = 32'he569f57b;
      expv[51] = 32'h3674bed5;
      expv[52] = 32'h5de841eb;
      expv[53] = 32'h2d369f12;
      expv[54] = 32'h754180e8;
      expv[55] = 32'hd4a724de;
      expv[56] = 32'hfd375b18;
      expv[57] = 32'h5eec02c7;
      expv[58] = 32'h66556c23;
      expv[59] = 32'h1f90b5a7;
      expv[60] = 32'hb14a3f31;
      expv[61] = 32'ha4a3c225;
      expv[62] = 32'h229d93c4;
      expv[63] = 32'h48c42c28;
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
