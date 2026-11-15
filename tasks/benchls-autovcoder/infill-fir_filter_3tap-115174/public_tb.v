// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_115174 dut (
    .clock(clk),
    .io_input(in_vec[39:30]),
    .io_taps_0(in_vec[29:20]),
    .io_taps_1(in_vec[19:10]),
    .io_taps_2(in_vec[9:0]),
    .io_output(out_vec[19:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'he85b9dc752;
    stim[1] = 40'hbab25813fb;
    stim[2] = 40'h58d387720d;
    stim[3] = 40'h6ec60aee43;
    stim[4] = 40'h49839f962e;
    stim[5] = 40'h309df072cb;
    stim[6] = 40'h355ddaf0cc;
    stim[7] = 40'hb713a0e7eb;
    stim[8] = 40'hf47d7560db;
    stim[9] = 40'hb1b9ee1aa2;
    stim[10] = 40'had5bf18b0e;
    stim[11] = 40'hcb728656c3;
    stim[12] = 40'h69901b78aa;
    stim[13] = 40'h92ef8fd8cc;
    stim[14] = 40'h48e5b8c4e7;
    stim[15] = 40'h67571467dc;
    stim[16] = 40'hd761aa501e;
    stim[17] = 40'h03dd147844;
    stim[18] = 40'ha01b6bf5e5;
    stim[19] = 40'hc0c2cfef49;
    stim[20] = 40'h6e7d500411;
    stim[21] = 40'h58777ee41d;
    stim[22] = 40'hfc739e25ae;
    stim[23] = 40'h9d11fa7fed;
    stim[24] = 40'h96a180b993;
    stim[25] = 40'hbbdf79e741;
    stim[26] = 40'hd8dae8490a;
    stim[27] = 40'he2fa5c7491;
    stim[28] = 40'hf5d7c6bf23;
    stim[29] = 40'h2250362387;
    stim[30] = 40'h6e062a867d;
    stim[31] = 40'hb5915100df;
    stim[32] = 40'h12edec8221;
    stim[33] = 40'h5aa813c840;
    stim[34] = 40'ha2ddfc2cda;
    stim[35] = 40'h3087d83d10;
    stim[36] = 40'h546cc86fff;
    stim[37] = 40'h9ced96604d;
    stim[38] = 40'h47a6ae67a3;
    stim[39] = 40'h6f295ccf39;
    stim[40] = 40'h0a1ce917bf;
    stim[41] = 40'hbb89df0b5f;
    stim[42] = 40'he3e13c127f;
    stim[43] = 40'h4c5c9a74ef;
    stim[44] = 40'h06a15dfd8a;
    stim[45] = 40'h1d1113c8a0;
    stim[46] = 40'h06168cea8c;
    stim[47] = 40'he13562417e;
    stim[48] = 40'hc51fa0b8e0;
    stim[49] = 40'hd461872fa7;
    stim[50] = 40'h4f2e6d52e2;
    stim[51] = 40'h836870dd29;
    stim[52] = 40'h1bc5b64690;
    stim[53] = 40'hbb6406f0af;
    stim[54] = 40'hd0276e0868;
    stim[55] = 40'h68c8d7fd9e;
    stim[56] = 40'h2d51cdc71a;
    stim[57] = 40'hd2c3c62fa6;
    stim[58] = 40'h0209e9ca7e;
    stim[59] = 40'hba38fe3a0e;
    stim[60] = 40'hc7f8372c5a;
    stim[61] = 40'h35f22ab92d;
    stim[62] = 40'h8aa1bc0aae;
    stim[63] = 40'hcb06144fa0;
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
      expv[0] = 20'hxxxxx;
      expv[1] = 20'hxxxxx;
      expv[2] = 20'hxxxxx;
      expv[3] = 20'h418e2;
      expv[4] = 20'h33fa2;
      expv[5] = 20'hb5b16;
      expv[6] = 20'he49ed;
      expv[7] = 20'hf8aed;
      expv[8] = 20'hca21a;
      expv[9] = 20'h0703f;
      expv[10] = 20'h05100;
      expv[11] = 20'he2b7a;
      expv[12] = 20'h1e09e;
      expv[13] = 20'h192bd;
      expv[14] = 20'h0e9e3;
      expv[15] = 20'hf4abf;
      expv[16] = 20'hee8c4;
      expv[17] = 20'h4015c;
      expv[18] = 20'h0c8ef;
      expv[19] = 20'hd6ca8;
      expv[20] = 20'h15d00;
      expv[21] = 20'hce35e;
      expv[22] = 20'hff9ab;
      expv[23] = 20'hfc70b;
      expv[24] = 20'he7302;
      expv[25] = 20'h52d4a;
      expv[26] = 20'hdb929;
      expv[27] = 20'he00ef;
      expv[28] = 20'h2243c;
      expv[29] = 20'hf87c1;
      expv[30] = 20'h0034f;
      expv[31] = 20'h19d9d;
      expv[32] = 20'hc2185;
      expv[33] = 20'hcc762;
      expv[34] = 20'hc9d34;
      expv[35] = 20'he0ff4;
      expv[36] = 20'h21e33;
      expv[37] = 20'hbb448;
      expv[38] = 20'h01926;
      expv[39] = 20'hbc063;
      expv[40] = 20'hc9ff1;
      expv[41] = 20'he7cbe;
      expv[42] = 20'hdb99a;
      expv[43] = 20'h111d1;
      expv[44] = 20'h33c07;
      expv[45] = 20'hed120;
      expv[46] = 20'h18b59;
      expv[47] = 20'h0b76c;
      expv[48] = 20'h08848;
      expv[49] = 20'hdc4e8;
      expv[50] = 20'h06a28;
      expv[51] = 20'hc9ba3;
      expv[52] = 20'h24762;
      expv[53] = 20'he5b38;
      expv[54] = 20'h04c34;
      expv[55] = 20'heaafc;
      expv[56] = 20'h0894a;
      expv[57] = 20'h3bf29;
      expv[58] = 20'h21613;
      expv[59] = 20'he4b0b;
      expv[60] = 20'h0aeca;
      expv[61] = 20'h0de7d;
      expv[62] = 20'hfd2d3;
      expv[63] = 20'h20f76;
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
