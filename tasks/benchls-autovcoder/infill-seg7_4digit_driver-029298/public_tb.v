// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_029298 dut (
    .clk(clk),
    .digit(in_vec[15:0]),
    .node(out_vec[11:8]),
    .segment(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h6bf7;
    stim[1] = 16'h06bb;
    stim[2] = 16'h52b7;
    stim[3] = 16'hddec;
    stim[4] = 16'hf6a1;
    stim[5] = 16'h1206;
    stim[6] = 16'ha24c;
    stim[7] = 16'h87b3;
    stim[8] = 16'h5d4c;
    stim[9] = 16'h05c3;
    stim[10] = 16'ha964;
    stim[11] = 16'h5c24;
    stim[12] = 16'h0388;
    stim[13] = 16'hddd4;
    stim[14] = 16'hb9f4;
    stim[15] = 16'h6efa;
    stim[16] = 16'h4137;
    stim[17] = 16'h9f5d;
    stim[18] = 16'h51db;
    stim[19] = 16'h33d9;
    stim[20] = 16'h7dcb;
    stim[21] = 16'hc631;
    stim[22] = 16'hb65e;
    stim[23] = 16'h2490;
    stim[24] = 16'h9460;
    stim[25] = 16'h88af;
    stim[26] = 16'h5b1e;
    stim[27] = 16'h6f22;
    stim[28] = 16'h0e6b;
    stim[29] = 16'hc8ad;
    stim[30] = 16'h1a93;
    stim[31] = 16'hf7f6;
    stim[32] = 16'hbfab;
    stim[33] = 16'hfdd4;
    stim[34] = 16'h35ad;
    stim[35] = 16'h4a6a;
    stim[36] = 16'hadb1;
    stim[37] = 16'hb2b7;
    stim[38] = 16'h2ed7;
    stim[39] = 16'h8171;
    stim[40] = 16'haf3b;
    stim[41] = 16'hbb26;
    stim[42] = 16'hea8c;
    stim[43] = 16'h4eb4;
    stim[44] = 16'hab11;
    stim[45] = 16'h74ad;
    stim[46] = 16'h41ae;
    stim[47] = 16'h3a29;
    stim[48] = 16'he6c6;
    stim[49] = 16'h3984;
    stim[50] = 16'hd157;
    stim[51] = 16'h5b99;
    stim[52] = 16'hddda;
    stim[53] = 16'he146;
    stim[54] = 16'hcd76;
    stim[55] = 16'hfccc;
    stim[56] = 16'h8bfe;
    stim[57] = 16'he2c0;
    stim[58] = 16'ha5ed;
    stim[59] = 16'ha6d0;
    stim[60] = 16'hd75e;
    stim[61] = 16'he3a5;
    stim[62] = 16'h8361;
    stim[63] = 16'h0b1f;
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
      expv[0] = 12'hxxx;
      expv[1] = 12'hec0;
      expv[2] = 12'hef8;
      expv[3] = 12'he83;
      expv[4] = 12'hef8;
      expv[5] = 12'hec6;
      expv[6] = 12'hef9;
      expv[7] = 12'he82;
      expv[8] = 12'hec6;
      expv[9] = 12'heb0;
      expv[10] = 12'hec6;
      expv[11] = 12'heb0;
      expv[12] = 12'he99;
      expv[13] = 12'he99;
      expv[14] = 12'he80;
      expv[15] = 12'he99;
      expv[16] = 12'he99;
      expv[17] = 12'he88;
      expv[18] = 12'hef8;
      expv[19] = 12'hea1;
      expv[20] = 12'he83;
      expv[21] = 12'he90;
      expv[22] = 12'he83;
      expv[23] = 12'hef9;
      expv[24] = 12'he86;
      expv[25] = 12'hec0;
      expv[26] = 12'hec0;
      expv[27] = 12'he8e;
      expv[28] = 12'he86;
      expv[29] = 12'hea4;
      expv[30] = 12'he83;
      expv[31] = 12'hea1;
      expv[32] = 12'heb0;
      expv[33] = 12'he82;
      expv[34] = 12'he83;
      expv[35] = 12'he99;
      expv[36] = 12'hea1;
      expv[37] = 12'he88;
      expv[38] = 12'hef9;
      expv[39] = 12'hef8;
      expv[40] = 12'hef8;
      expv[41] = 12'hef9;
      expv[42] = 12'he83;
      expv[43] = 12'he82;
      expv[44] = 12'hec6;
      expv[45] = 12'he99;
      expv[46] = 12'hef9;
      expv[47] = 12'hea1;
      expv[48] = 12'he86;
      expv[49] = 12'he90;
      expv[50] = 12'he82;
      expv[51] = 12'he99;
      expv[52] = 12'hef8;
      expv[53] = 12'he90;
      expv[54] = 12'he88;
      expv[55] = 12'he82;
      expv[56] = 12'he82;
      expv[57] = 12'hec6;
      expv[58] = 12'he86;
      expv[59] = 12'hec0;
      expv[60] = 12'hea1;
      expv[61] = 12'hec0;
      expv[62] = 12'he86;
      expv[63] = 12'he92;
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
