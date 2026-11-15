// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00106 dut (
    .in(in_vec[7:1]),
    .vdd18(in_vec[0:0]),
    .vrefcode(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h1f;
    stim[1] = 8'h39;
    stim[2] = 8'h0e;
    stim[3] = 8'h75;
    stim[4] = 8'hd6;
    stim[5] = 8'hfc;
    stim[6] = 8'he7;
    stim[7] = 8'hdd;
    stim[8] = 8'hd1;
    stim[9] = 8'h4a;
    stim[10] = 8'hfa;
    stim[11] = 8'h06;
    stim[12] = 8'h1c;
    stim[13] = 8'hb2;
    stim[14] = 8'hbb;
    stim[15] = 8'h51;
    stim[16] = 8'h47;
    stim[17] = 8'he1;
    stim[18] = 8'hba;
    stim[19] = 8'h96;
    stim[20] = 8'he0;
    stim[21] = 8'he0;
    stim[22] = 8'h2d;
    stim[23] = 8'h7e;
    stim[24] = 8'h2f;
    stim[25] = 8'h88;
    stim[26] = 8'h11;
    stim[27] = 8'hd6;
    stim[28] = 8'ha9;
    stim[29] = 8'h56;
    stim[30] = 8'hec;
    stim[31] = 8'hcd;
    stim[32] = 8'h9e;
    stim[33] = 8'h2d;
    stim[34] = 8'h28;
    stim[35] = 8'h0f;
    stim[36] = 8'hed;
    stim[37] = 8'h93;
    stim[38] = 8'hd0;
    stim[39] = 8'hcb;
    stim[40] = 8'h66;
    stim[41] = 8'hce;
    stim[42] = 8'h5c;
    stim[43] = 8'h9b;
    stim[44] = 8'hf1;
    stim[45] = 8'h73;
    stim[46] = 8'h95;
    stim[47] = 8'hd1;
    stim[48] = 8'h54;
    stim[49] = 8'hd5;
    stim[50] = 8'hd3;
    stim[51] = 8'hd0;
    stim[52] = 8'h9f;
    stim[53] = 8'h0d;
    stim[54] = 8'h9b;
    stim[55] = 8'h26;
    stim[56] = 8'h33;
    stim[57] = 8'hf4;
    stim[58] = 8'h37;
    stim[59] = 8'hc2;
    stim[60] = 8'h55;
    stim[61] = 8'h2f;
    stim[62] = 8'hf3;
    stim[63] = 8'h55;
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
      expv[0] = 8'h1e;
      expv[1] = 8'h38;
      expv[2] = 8'h0e;
      expv[3] = 8'h74;
      expv[4] = 8'hd6;
      expv[5] = 8'hfc;
      expv[6] = 8'he6;
      expv[7] = 8'hdc;
      expv[8] = 8'hd0;
      expv[9] = 8'h4a;
      expv[10] = 8'hfa;
      expv[11] = 8'h06;
      expv[12] = 8'h1c;
      expv[13] = 8'hb2;
      expv[14] = 8'hba;
      expv[15] = 8'h50;
      expv[16] = 8'h46;
      expv[17] = 8'he0;
      expv[18] = 8'hba;
      expv[19] = 8'h96;
      expv[20] = 8'he0;
      expv[21] = 8'he0;
      expv[22] = 8'h2c;
      expv[23] = 8'h7e;
      expv[24] = 8'h2e;
      expv[25] = 8'h88;
      expv[26] = 8'h10;
      expv[27] = 8'hd6;
      expv[28] = 8'ha8;
      expv[29] = 8'h56;
      expv[30] = 8'hec;
      expv[31] = 8'hcc;
      expv[32] = 8'h9e;
      expv[33] = 8'h2c;
      expv[34] = 8'h28;
      expv[35] = 8'h0e;
      expv[36] = 8'hec;
      expv[37] = 8'h92;
      expv[38] = 8'hd0;
      expv[39] = 8'hca;
      expv[40] = 8'h66;
      expv[41] = 8'hce;
      expv[42] = 8'h5c;
      expv[43] = 8'h9a;
      expv[44] = 8'hf0;
      expv[45] = 8'h72;
      expv[46] = 8'h94;
      expv[47] = 8'hd0;
      expv[48] = 8'h54;
      expv[49] = 8'hd4;
      expv[50] = 8'hd2;
      expv[51] = 8'hd0;
      expv[52] = 8'h9e;
      expv[53] = 8'h0c;
      expv[54] = 8'h9a;
      expv[55] = 8'h26;
      expv[56] = 8'h32;
      expv[57] = 8'hf4;
      expv[58] = 8'h36;
      expv[59] = 8'hc2;
      expv[60] = 8'h54;
      expv[61] = 8'h2e;
      expv[62] = 8'hf2;
      expv[63] = 8'h54;
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
