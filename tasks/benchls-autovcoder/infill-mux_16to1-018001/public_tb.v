// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_018001 dut (
    .sel(in_vec[35:32]),
    .in_0(in_vec[31:30]),
    .in_1(in_vec[29:28]),
    .in_2(in_vec[27:26]),
    .in_3(in_vec[25:24]),
    .in_4(in_vec[23:22]),
    .in_5(in_vec[21:20]),
    .in_6(in_vec[19:18]),
    .in_7(in_vec[17:16]),
    .in_8(in_vec[15:14]),
    .in_9(in_vec[13:12]),
    .in_10(in_vec[11:10]),
    .in_11(in_vec[9:8]),
    .in_12(in_vec[7:6]),
    .in_13(in_vec[5:4]),
    .in_14(in_vec[3:2]),
    .in_15(in_vec[1:0]),
    .out(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h1792e4a05;
    stim[1] = 36'hd47ae745c;
    stim[2] = 36'hd8557607e;
    stim[3] = 36'haba9a01fe;
    stim[4] = 36'he05ac081a;
    stim[5] = 36'h7102ca33a;
    stim[6] = 36'hca4ffae62;
    stim[7] = 36'h2bf3c223e;
    stim[8] = 36'h6c83102af;
    stim[9] = 36'h1412f0f48;
    stim[10] = 36'h984678505;
    stim[11] = 36'h194eeeee7;
    stim[12] = 36'hb63e9340d;
    stim[13] = 36'h73eddab01;
    stim[14] = 36'hb3e9fc0f9;
    stim[15] = 36'h90cd15c7c;
    stim[16] = 36'h53f26e062;
    stim[17] = 36'hb0e7752b9;
    stim[18] = 36'h50954947b;
    stim[19] = 36'hcf9183c6e;
    stim[20] = 36'hfe62e64ce;
    stim[21] = 36'hb46b0fcbd;
    stim[22] = 36'h52fc564f4;
    stim[23] = 36'h89abb58aa;
    stim[24] = 36'h063404a92;
    stim[25] = 36'he11297ccd;
    stim[26] = 36'h1a08904fa;
    stim[27] = 36'h94c1c9f60;
    stim[28] = 36'h2ba33fe50;
    stim[29] = 36'hd0531f501;
    stim[30] = 36'hf45602503;
    stim[31] = 36'h1058445ef;
    stim[32] = 36'h528d38f6e;
    stim[33] = 36'h2424bf0d7;
    stim[34] = 36'hd970eec8c;
    stim[35] = 36'h7a93dfb93;
    stim[36] = 36'h411a188c9;
    stim[37] = 36'h270fd6c2b;
    stim[38] = 36'h211786a15;
    stim[39] = 36'h71e51febd;
    stim[40] = 36'h58daac501;
    stim[41] = 36'h22ee341f7;
    stim[42] = 36'hb8e46a995;
    stim[43] = 36'h1460444d6;
    stim[44] = 36'hf4ee968a9;
    stim[45] = 36'h35db5f40e;
    stim[46] = 36'h82cf3b42c;
    stim[47] = 36'he56916e87;
    stim[48] = 36'hc48294cdb;
    stim[49] = 36'hbd2a85199;
    stim[50] = 36'ha337e8ada;
    stim[51] = 36'h22e2bdf89;
    stim[52] = 36'hf853d8e1f;
    stim[53] = 36'heb8c19ac6;
    stim[54] = 36'he1e5fbb06;
    stim[55] = 36'h6535207df;
    stim[56] = 36'hfe0fd9be7;
    stim[57] = 36'h0914c52e8;
    stim[58] = 36'hfad2483d3;
    stim[59] = 36'hfe9198eae;
    stim[60] = 36'h72f2b8950;
    stim[61] = 36'h26cc83647;
    stim[62] = 36'h3580b08fc;
    stim[63] = 36'h0d956d230;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 2'h3;
      expv[1] = 2'h1;
      expv[2] = 2'h3;
      expv[3] = 2'h0;
      expv[4] = 2'h2;
      expv[5] = 2'h0;
      expv[6] = 2'h1;
      expv[7] = 2'h3;
      expv[8] = 2'h0;
      expv[9] = 2'h0;
      expv[10] = 2'h0;
      expv[11] = 2'h1;
      expv[12] = 2'h0;
      expv[13] = 2'h1;
      expv[14] = 2'h0;
      expv[15] = 2'h1;
      expv[16] = 2'h2;
      expv[17] = 2'h2;
      expv[18] = 2'h1;
      expv[19] = 2'h1;
      expv[20] = 2'h2;
      expv[21] = 2'h0;
      expv[22] = 2'h0;
      expv[23] = 2'h1;
      expv[24] = 2'h1;
      expv[25] = 2'h3;
      expv[26] = 2'h2;
      expv[27] = 2'h1;
      expv[28] = 2'h2;
      expv[29] = 2'h0;
      expv[30] = 2'h3;
      expv[31] = 2'h0;
      expv[32] = 2'h1;
      expv[33] = 2'h0;
      expv[34] = 2'h0;
      expv[35] = 2'h1;
      expv[36] = 2'h2;
      expv[37] = 2'h0;
      expv[38] = 2'h0;
      expv[39] = 2'h1;
      expv[40] = 2'h2;
      expv[41] = 2'h3;
      expv[42] = 2'h1;
      expv[43] = 2'h0;
      expv[44] = 2'h1;
      expv[45] = 2'h1;
      expv[46] = 2'h2;
      expv[47] = 2'h1;
      expv[48] = 2'h3;
      expv[49] = 2'h1;
      expv[50] = 2'h2;
      expv[51] = 2'h3;
      expv[52] = 2'h3;
      expv[53] = 2'h1;
      expv[54] = 2'h1;
      expv[55] = 2'h0;
      expv[56] = 2'h3;
      expv[57] = 2'h2;
      expv[58] = 2'h3;
      expv[59] = 2'h2;
      expv[60] = 2'h3;
      expv[61] = 2'h3;
      expv[62] = 2'h0;
      expv[63] = 2'h3;
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
