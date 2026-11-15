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

  gf_mult_by_71 dut (
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
    stim[0] = 8'h87;
    stim[1] = 8'h31;
    stim[2] = 8'h0a;
    stim[3] = 8'h7b;
    stim[4] = 8'hc7;
    stim[5] = 8'h44;
    stim[6] = 8'h15;
    stim[7] = 8'h59;
    stim[8] = 8'hbb;
    stim[9] = 8'h3a;
    stim[10] = 8'hca;
    stim[11] = 8'h61;
    stim[12] = 8'h26;
    stim[13] = 8'h56;
    stim[14] = 8'h85;
    stim[15] = 8'h62;
    stim[16] = 8'he6;
    stim[17] = 8'ha1;
    stim[18] = 8'h87;
    stim[19] = 8'hc9;
    stim[20] = 8'he7;
    stim[21] = 8'hcb;
    stim[22] = 8'h54;
    stim[23] = 8'he5;
    stim[24] = 8'h47;
    stim[25] = 8'hca;
    stim[26] = 8'h7a;
    stim[27] = 8'hf8;
    stim[28] = 8'h23;
    stim[29] = 8'he5;
    stim[30] = 8'h0d;
    stim[31] = 8'h4b;
    stim[32] = 8'h3b;
    stim[33] = 8'h62;
    stim[34] = 8'hd7;
    stim[35] = 8'h97;
    stim[36] = 8'h9f;
    stim[37] = 8'hfb;
    stim[38] = 8'hbd;
    stim[39] = 8'hfc;
    stim[40] = 8'h72;
    stim[41] = 8'h60;
    stim[42] = 8'h43;
    stim[43] = 8'hc5;
    stim[44] = 8'h5c;
    stim[45] = 8'haa;
    stim[46] = 8'h70;
    stim[47] = 8'hc4;
    stim[48] = 8'h25;
    stim[49] = 8'h18;
    stim[50] = 8'h02;
    stim[51] = 8'h16;
    stim[52] = 8'h77;
    stim[53] = 8'h33;
    stim[54] = 8'h47;
    stim[55] = 8'h56;
    stim[56] = 8'hdd;
    stim[57] = 8'hfc;
    stim[58] = 8'h84;
    stim[59] = 8'h02;
    stim[60] = 8'h41;
    stim[61] = 8'hdd;
    stim[62] = 8'h87;
    stim[63] = 8'h74;
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
      expv[0] = 8'h68;
      expv[1] = 8'hb4;
      expv[2] = 8'h4d;
      expv[3] = 8'he8;
      expv[4] = 8'h79;
      expv[5] = 8'hc8;
      expv[6] = 8'heb;
      expv[7] = 8'h8c;
      expv[8] = 8'hdb;
      expv[9] = 8'h88;
      expv[10] = 8'h7e;
      expv[11] = 8'he6;
      expv[12] = 8'hbd;
      expv[13] = 8'h69;
      expv[14] = 8'h8a;
      expv[15] = 8'h75;
      expv[16] = 8'h8e;
      expv[17] = 8'hd5;
      expv[18] = 8'h68;
      expv[19] = 8'hed;
      expv[20] = 8'hff;
      expv[21] = 8'h0f;
      expv[22] = 8'h8b;
      expv[23] = 8'h1d;
      expv[24] = 8'h5b;
      expv[25] = 8'h7e;
      expv[26] = 8'h99;
      expv[27] = 8'h59;
      expv[28] = 8'h15;
      expv[29] = 8'h1d;
      expv[30] = 8'h07;
      expv[31] = 8'h2d;
      expv[32] = 8'hf9;
      expv[33] = 8'h75;
      expv[34] = 8'h3a;
      expv[35] = 8'h2b;
      expv[36] = 8'h84;
      expv[37] = 8'hca;
      expv[38] = 8'he0;
      expv[39] = 8'h80;
      expv[40] = 8'h36;
      expv[41] = 8'h97;
      expv[42] = 8'h82;
      expv[43] = 8'h9b;
      expv[44] = 8'h24;
      expv[45] = 8'he9;
      expv[46] = 8'hd4;
      expv[47] = 8'hea;
      expv[48] = 8'h2e;
      expv[49] = 8'hec;
      expv[50] = 8'he2;
      expv[51] = 8'h78;
      expv[52] = 8'h9e;
      expv[53] = 8'h56;
      expv[54] = 8'h5b;
      expv[55] = 8'h69;
      expv[56] = 8'h77;
      expv[57] = 8'h80;
      expv[58] = 8'hfb;
      expv[59] = 8'he2;
      expv[60] = 8'h60;
      expv[61] = 8'h77;
      expv[62] = 8'h68;
      expv[63] = 8'h0d;
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
