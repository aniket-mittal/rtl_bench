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

  gf_mult_by_0c dut (
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
    stim[0] = 8'h16;
    stim[1] = 8'h7f;
    stim[2] = 8'ha9;
    stim[3] = 8'h8b;
    stim[4] = 8'he5;
    stim[5] = 8'h9e;
    stim[6] = 8'h7d;
    stim[7] = 8'hb1;
    stim[8] = 8'h83;
    stim[9] = 8'hc6;
    stim[10] = 8'h02;
    stim[11] = 8'h96;
    stim[12] = 8'hb2;
    stim[13] = 8'hbb;
    stim[14] = 8'ha7;
    stim[15] = 8'hb2;
    stim[16] = 8'ha0;
    stim[17] = 8'hc9;
    stim[18] = 8'h58;
    stim[19] = 8'h79;
    stim[20] = 8'hc9;
    stim[21] = 8'hc8;
    stim[22] = 8'hdf;
    stim[23] = 8'h21;
    stim[24] = 8'h26;
    stim[25] = 8'hd0;
    stim[26] = 8'h29;
    stim[27] = 8'h3b;
    stim[28] = 8'h6b;
    stim[29] = 8'h9e;
    stim[30] = 8'hab;
    stim[31] = 8'hfe;
    stim[32] = 8'he8;
    stim[33] = 8'h20;
    stim[34] = 8'hc3;
    stim[35] = 8'he8;
    stim[36] = 8'h8a;
    stim[37] = 8'h3e;
    stim[38] = 8'h46;
    stim[39] = 8'ha8;
    stim[40] = 8'h38;
    stim[41] = 8'h01;
    stim[42] = 8'hd5;
    stim[43] = 8'h4f;
    stim[44] = 8'h58;
    stim[45] = 8'h90;
    stim[46] = 8'h9d;
    stim[47] = 8'ha1;
    stim[48] = 8'h45;
    stim[49] = 8'hc3;
    stim[50] = 8'hb9;
    stim[51] = 8'h7c;
    stim[52] = 8'h81;
    stim[53] = 8'h42;
    stim[54] = 8'h1e;
    stim[55] = 8'hf3;
    stim[56] = 8'hea;
    stim[57] = 8'h21;
    stim[58] = 8'h44;
    stim[59] = 8'h00;
    stim[60] = 8'h3a;
    stim[61] = 8'h5e;
    stim[62] = 8'h91;
    stim[63] = 8'hc4;
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
      expv[0] = 8'he8;
      expv[1] = 8'h3e;
      expv[2] = 8'hbf;
      expv[3] = 8'h3a;
      expv[4] = 8'hc8;
      expv[5] = 8'hc6;
      expv[6] = 8'h26;
      expv[7] = 8'h1f;
      expv[8] = 8'h5a;
      expv[9] = 8'h41;
      expv[10] = 8'h18;
      expv[11] = 8'ha6;
      expv[12] = 8'h0b;
      expv[13] = 8'h67;
      expv[14] = 8'hf7;
      expv[15] = 8'h0b;
      expv[16] = 8'hd3;
      expv[17] = 8'h05;
      expv[18] = 8'h87;
      expv[19] = 8'h16;
      expv[20] = 8'h05;
      expv[21] = 8'h09;
      expv[22] = 8'hed;
      expv[23] = 8'h91;
      expv[24] = 8'hb5;
      expv[25] = 8'ha9;
      expv[26] = 8'hf1;
      expv[27] = 8'h29;
      expv[28] = 8'hce;
      expv[29] = 8'hc6;
      expv[30] = 8'ha7;
      expv[31] = 8'h7c;
      expv[32] = 8'h94;
      expv[33] = 8'h9d;
      expv[34] = 8'h7d;
      expv[35] = 8'h94;
      expv[36] = 8'h36;
      expv[37] = 8'h15;
      expv[38] = 8'h0f;
      expv[39] = 8'hb3;
      expv[40] = 8'h3d;
      expv[41] = 8'h0c;
      expv[42] = 8'h95;
      expv[43] = 8'h63;
      expv[44] = 8'h87;
      expv[45] = 8'h8e;
      expv[46] = 8'hd2;
      expv[47] = 8'hdf;
      expv[48] = 8'h1b;
      expv[49] = 8'h7d;
      expv[50] = 8'h7f;
      expv[51] = 8'h2a;
      expv[52] = 8'h42;
      expv[53] = 8'h3f;
      expv[54] = 8'h88;
      expv[55] = 8'h20;
      expv[56] = 8'h8c;
      expv[57] = 8'h91;
      expv[58] = 8'h17;
      expv[59] = 8'h00;
      expv[60] = 8'h25;
      expv[61] = 8'haf;
      expv[62] = 8'h82;
      expv[63] = 8'h59;
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
