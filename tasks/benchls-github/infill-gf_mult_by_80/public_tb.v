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

  gf_mult_by_80 dut (
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
    stim[0] = 8'hbc;
    stim[1] = 8'h19;
    stim[2] = 8'h10;
    stim[3] = 8'h2d;
    stim[4] = 8'h32;
    stim[5] = 8'h91;
    stim[6] = 8'h2b;
    stim[7] = 8'h61;
    stim[8] = 8'h17;
    stim[9] = 8'he9;
    stim[10] = 8'h59;
    stim[11] = 8'he2;
    stim[12] = 8'h92;
    stim[13] = 8'hb3;
    stim[14] = 8'he0;
    stim[15] = 8'h21;
    stim[16] = 8'hf0;
    stim[17] = 8'hbd;
    stim[18] = 8'h1a;
    stim[19] = 8'h67;
    stim[20] = 8'hee;
    stim[21] = 8'h23;
    stim[22] = 8'h9f;
    stim[23] = 8'h35;
    stim[24] = 8'h86;
    stim[25] = 8'h46;
    stim[26] = 8'hcc;
    stim[27] = 8'h90;
    stim[28] = 8'hd7;
    stim[29] = 8'h3a;
    stim[30] = 8'ha1;
    stim[31] = 8'h1d;
    stim[32] = 8'hb9;
    stim[33] = 8'hcd;
    stim[34] = 8'hc8;
    stim[35] = 8'h7c;
    stim[36] = 8'haf;
    stim[37] = 8'h20;
    stim[38] = 8'h77;
    stim[39] = 8'hb1;
    stim[40] = 8'hcb;
    stim[41] = 8'hc3;
    stim[42] = 8'hd0;
    stim[43] = 8'h14;
    stim[44] = 8'h46;
    stim[45] = 8'h96;
    stim[46] = 8'hc5;
    stim[47] = 8'h24;
    stim[48] = 8'h42;
    stim[49] = 8'h7a;
    stim[50] = 8'h9a;
    stim[51] = 8'h55;
    stim[52] = 8'h21;
    stim[53] = 8'hf2;
    stim[54] = 8'he2;
    stim[55] = 8'h23;
    stim[56] = 8'h69;
    stim[57] = 8'hee;
    stim[58] = 8'h5b;
    stim[59] = 8'h12;
    stim[60] = 8'h03;
    stim[61] = 8'hfe;
    stim[62] = 8'h57;
    stim[63] = 8'h99;
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
      expv[0] = 8'h78;
      expv[1] = 8'h1c;
      expv[2] = 8'he8;
      expv[3] = 8'h03;
      expv[4] = 8'h38;
      expv[5] = 8'h7b;
      expv[6] = 8'h24;
      expv[7] = 8'hca;
      expv[8] = 8'h4f;
      expv[9] = 8'had;
      expv[10] = 8'h9b;
      expv[11] = 8'h44;
      expv[12] = 8'he6;
      expv[13] = 8'hab;
      expv[14] = 8'h59;
      expv[15] = 8'h4d;
      expv[16] = 8'hb1;
      expv[17] = 8'hf8;
      expv[18] = 8'h81;
      expv[19] = 8'hed;
      expv[20] = 8'h0a;
      expv[21] = 8'h50;
      expv[22] = 8'h28;
      expv[23] = 8'h9f;
      expv[24] = 8'h34;
      expv[25] = 8'ha0;
      expv[26] = 8'hda;
      expv[27] = 8'hfb;
      expv[28] = 8'hdb;
      expv[29] = 8'h4c;
      expv[30] = 8'h5e;
      expv[31] = 8'h26;
      expv[32] = 8'hc2;
      expv[33] = 8'h5a;
      expv[34] = 8'he0;
      expv[35] = 8'hec;
      expv[36] = 8'h0d;
      expv[37] = 8'hcd;
      expv[38] = 8'h05;
      expv[39] = 8'hb6;
      expv[40] = 8'h7d;
      expv[41] = 8'h09;
      expv[42] = 8'h7c;
      expv[43] = 8'hd2;
      expv[44] = 8'ha0;
      expv[45] = 8'hdc;
      expv[46] = 8'h2e;
      expv[47] = 8'hf7;
      expv[48] = 8'h9a;
      expv[49] = 8'hcb;
      expv[50] = 8'h92;
      expv[51] = 8'hd5;
      expv[52] = 8'h4d;
      expv[53] = 8'hac;
      expv[54] = 8'h44;
      expv[55] = 8'h50;
      expv[56] = 8'hbe;
      expv[57] = 8'h0a;
      expv[58] = 8'h86;
      expv[59] = 8'hf5;
      expv[60] = 8'h9d;
      expv[61] = 8'he2;
      expv[62] = 8'hc8;
      expv[63] = 8'h0f;
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
