// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_144948 dut (
    .clk(clk),
    .rst(in_vec[16:16]),
    .x_in(in_vec[15:0]),
    .y_out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h16835;
    stim[1] = 17'h183b4;
    stim[2] = 17'h07234;
    stim[3] = 17'h04260;
    stim[4] = 17'h021ac;
    stim[5] = 17'h00e13;
    stim[6] = 17'h0cb0c;
    stim[7] = 17'h0c96c;
    stim[8] = 17'h03f5e;
    stim[9] = 17'h0513b;
    stim[10] = 17'h0849a;
    stim[11] = 17'h0ccfd;
    stim[12] = 17'h016d0;
    stim[13] = 17'h00428;
    stim[14] = 17'h0fa07;
    stim[15] = 17'h06f63;
    stim[16] = 17'h054fc;
    stim[17] = 17'h0e286;
    stim[18] = 17'h00b25;
    stim[19] = 17'h0d636;
    stim[20] = 17'h0136d;
    stim[21] = 17'h0bec4;
    stim[22] = 17'h000fe;
    stim[23] = 17'h09877;
    stim[24] = 17'h0f664;
    stim[25] = 17'h0f092;
    stim[26] = 17'h0e62a;
    stim[27] = 17'h00fe1;
    stim[28] = 17'h00cd2;
    stim[29] = 17'h05f8c;
    stim[30] = 17'h01a27;
    stim[31] = 17'h0bf33;
    stim[32] = 17'h0c020;
    stim[33] = 17'h04cb8;
    stim[34] = 17'h010ac;
    stim[35] = 17'h02293;
    stim[36] = 17'h0650c;
    stim[37] = 17'h09738;
    stim[38] = 17'h01c43;
    stim[39] = 17'h0abbd;
    stim[40] = 17'h09d45;
    stim[41] = 17'h0ac5d;
    stim[42] = 17'h0bdd2;
    stim[43] = 17'h0fc00;
    stim[44] = 17'h0c8a9;
    stim[45] = 17'h08b24;
    stim[46] = 17'h07af2;
    stim[47] = 17'h06750;
    stim[48] = 17'h0de33;
    stim[49] = 17'h0a896;
    stim[50] = 17'h0e9b2;
    stim[51] = 17'h04b58;
    stim[52] = 17'h010bd;
    stim[53] = 17'h0c7eb;
    stim[54] = 17'h01894;
    stim[55] = 17'h00e23;
    stim[56] = 17'h0952c;
    stim[57] = 17'h04706;
    stim[58] = 17'h02e91;
    stim[59] = 17'h01b44;
    stim[60] = 17'h046e9;
    stim[61] = 17'h014e9;
    stim[62] = 17'h0fd88;
    stim[63] = 17'h0d395;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'h7234;
      expv[5] = 16'h26c8;
      expv[6] = 16'hfd08;
      expv[7] = 16'h6f27;
      expv[8] = 16'h858a;
      expv[9] = 16'hbb19;
      expv[10] = 16'h6da3;
      expv[11] = 16'ha8ba;
      expv[12] = 16'hfa54;
      expv[13] = 16'h8567;
      expv[14] = 16'hf4e7;
      expv[15] = 16'hc039;
      expv[16] = 16'he6f4;
      expv[17] = 16'h3a81;
      expv[18] = 16'h80fb;
      expv[19] = 16'h7bd4;
      expv[20] = 16'h5224;
      expv[21] = 16'h6934;
      expv[22] = 16'h4b2f;
      expv[23] = 16'h4ab1;
      expv[24] = 16'hc47a;
      expv[25] = 16'h502e;
      expv[26] = 16'h2142;
      expv[27] = 16'h8452;
      expv[28] = 16'h2b5b;
      expv[29] = 16'h47fe;
      expv[30] = 16'ha806;
      expv[31] = 16'h1bd8;
      expv[32] = 16'h0d59;
      expv[33] = 16'hc977;
      expv[34] = 16'h59fb;
      expv[35] = 16'hf3d6;
      expv[36] = 16'h9242;
      expv[37] = 16'h623e;
      expv[38] = 16'h9621;
      expv[39] = 16'hdd96;
      expv[40] = 16'h8d4f;
      expv[41] = 16'h0a3f;
      expv[42] = 16'h260a;
      expv[43] = 16'hbb6c;
      expv[44] = 16'h147b;
      expv[45] = 16'hf3b3;
      expv[46] = 16'h6273;
      expv[47] = 16'h3f22;
      expv[48] = 16'ha93a;
      expv[49] = 16'h984a;
      expv[50] = 16'h0479;
      expv[51] = 16'h20c5;
      expv[52] = 16'ha781;
      expv[53] = 16'h6897;
      expv[54] = 16'hc65d;
      expv[55] = 16'h6585;
      expv[56] = 16'h6caf;
      expv[57] = 16'h4196;
      expv[58] = 16'ha483;
      expv[59] = 16'hb882;
      expv[60] = 16'hca9a;
      expv[61] = 16'he507;
      expv[62] = 16'h9612;
      expv[63] = 16'he26a;
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
