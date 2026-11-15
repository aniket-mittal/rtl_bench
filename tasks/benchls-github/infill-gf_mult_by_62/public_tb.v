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

  gf_mult_by_62 dut (
    .i(in_vec[7:0]),
    .o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h1a;
    stim[1] = 8'h34;
    stim[2] = 8'hf7;
    stim[3] = 8'h28;
    stim[4] = 8'hf7;
    stim[5] = 8'h2d;
    stim[6] = 8'h64;
    stim[7] = 8'hd2;
    stim[8] = 8'ha6;
    stim[9] = 8'h1d;
    stim[10] = 8'hcb;
    stim[11] = 8'h77;
    stim[12] = 8'hf4;
    stim[13] = 8'hec;
    stim[14] = 8'h9b;
    stim[15] = 8'hb4;
    stim[16] = 8'h38;
    stim[17] = 8'he1;
    stim[18] = 8'h62;
    stim[19] = 8'h60;
    stim[20] = 8'h97;
    stim[21] = 8'h55;
    stim[22] = 8'h36;
    stim[23] = 8'hfa;
    stim[24] = 8'h2c;
    stim[25] = 8'ha6;
    stim[26] = 8'h1c;
    stim[27] = 8'h75;
    stim[28] = 8'hd6;
    stim[29] = 8'hf2;
    stim[30] = 8'h5c;
    stim[31] = 8'heb;
    stim[32] = 8'hf0;
    stim[33] = 8'h7c;
    stim[34] = 8'hfd;
    stim[35] = 8'h83;
    stim[36] = 8'h9a;
    stim[37] = 8'hdc;
    stim[38] = 8'h55;
    stim[39] = 8'h1c;
    stim[40] = 8'h7c;
    stim[41] = 8'h20;
    stim[42] = 8'h25;
    stim[43] = 8'hc7;
    stim[44] = 8'hf7;
    stim[45] = 8'h1c;
    stim[46] = 8'h25;
    stim[47] = 8'h20;
    stim[48] = 8'hd0;
    stim[49] = 8'h27;
    stim[50] = 8'h68;
    stim[51] = 8'h3c;
    stim[52] = 8'h54;
    stim[53] = 8'hc2;
    stim[54] = 8'hce;
    stim[55] = 8'h0e;
    stim[56] = 8'h84;
    stim[57] = 8'h52;
    stim[58] = 8'hb1;
    stim[59] = 8'hcf;
    stim[60] = 8'h76;
    stim[61] = 8'h0a;
    stim[62] = 8'h91;
    stim[63] = 8'h34;
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
      expv[0] = 8'h9d;
      expv[1] = 8'h27;
      expv[2] = 8'h73;
      expv[3] = 8'heb;
      expv[4] = 8'h73;
      expv[5] = 8'h1c;
      expv[6] = 8'hec;
      expv[7] = 8'h58;
      expv[8] = 8'hda;
      expv[9] = 8'hae;
      expv[10] = 8'h63;
      expv[11] = 8'h24;
      expv[12] = 8'hd5;
      expv[13] = 8'h8c;
      expv[14] = 8'ha8;
      expv[15] = 8'h70;
      expv[16] = 8'h85;
      expv[17] = 8'h4c;
      expv[18] = 8'hbd;
      expv[19] = 8'h79;
      expv[20] = 8'h0a;
      expv[21] = 8'h3c;
      expv[22] = 8'he3;
      expv[23] = 8'hb3;
      expv[24] = 8'h7e;
      expv[25] = 8'hda;
      expv[26] = 8'hcc;
      expv[27] = 8'he0;
      expv[28] = 8'hcd;
      expv[29] = 8'h84;
      expv[30] = 8'h69;
      expv[31] = 8'hbf;
      expv[32] = 8'h40;
      expv[33] = 8'hb5;
      expv[34] = 8'h80;
      expv[35] = 8'hf1;
      expv[36] = 8'hca;
      expv[37] = 8'h3e;
      expv[38] = 8'h3c;
      expv[39] = 8'hcc;
      expv[40] = 8'hb5;
      expv[41] = 8'hdc;
      expv[42] = 8'h2b;
      expv[43] = 8'hc1;
      expv[44] = 8'h73;
      expv[45] = 8'hcc;
      expv[46] = 8'h2b;
      expv[47] = 8'hdc;
      expv[48] = 8'h9c;
      expv[49] = 8'hef;
      expv[50] = 8'h4e;
      expv[51] = 8'h10;
      expv[52] = 8'h5e;
      expv[53] = 8'h36;
      expv[54] = 8'h94;
      expv[55] = 8'h66;
      expv[56] = 8'hc2;
      expv[57] = 8'h0f;
      expv[58] = 8'h87;
      expv[59] = 8'hf6;
      expv[60] = 8'h46;
      expv[61] = 8'hf3;
      expv[62] = 8'h5b;
      expv[63] = 8'h27;
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
