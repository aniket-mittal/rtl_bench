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

  gf_mult_by_67 dut (
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
    stim[0] = 8'h1e;
    stim[1] = 8'h82;
    stim[2] = 8'ha2;
    stim[3] = 8'h03;
    stim[4] = 8'h43;
    stim[5] = 8'h55;
    stim[6] = 8'h9f;
    stim[7] = 8'hb6;
    stim[8] = 8'haa;
    stim[9] = 8'h35;
    stim[10] = 8'hbe;
    stim[11] = 8'h52;
    stim[12] = 8'h21;
    stim[13] = 8'h35;
    stim[14] = 8'h25;
    stim[15] = 8'hd6;
    stim[16] = 8'h2c;
    stim[17] = 8'hc7;
    stim[18] = 8'h94;
    stim[19] = 8'ha3;
    stim[20] = 8'h83;
    stim[21] = 8'h44;
    stim[22] = 8'h70;
    stim[23] = 8'h3e;
    stim[24] = 8'h13;
    stim[25] = 8'h71;
    stim[26] = 8'h5b;
    stim[27] = 8'hf4;
    stim[28] = 8'h0c;
    stim[29] = 8'hef;
    stim[30] = 8'h83;
    stim[31] = 8'hf2;
    stim[32] = 8'h69;
    stim[33] = 8'ha0;
    stim[34] = 8'h3d;
    stim[35] = 8'h97;
    stim[36] = 8'h32;
    stim[37] = 8'hf2;
    stim[38] = 8'h0f;
    stim[39] = 8'hb6;
    stim[40] = 8'h20;
    stim[41] = 8'h8d;
    stim[42] = 8'hcf;
    stim[43] = 8'h21;
    stim[44] = 8'h95;
    stim[45] = 8'hdd;
    stim[46] = 8'h16;
    stim[47] = 8'h19;
    stim[48] = 8'hfa;
    stim[49] = 8'h0b;
    stim[50] = 8'h06;
    stim[51] = 8'ha6;
    stim[52] = 8'h9d;
    stim[53] = 8'h87;
    stim[54] = 8'hbc;
    stim[55] = 8'hc3;
    stim[56] = 8'ha3;
    stim[57] = 8'hac;
    stim[58] = 8'haa;
    stim[59] = 8'h87;
    stim[60] = 8'hbe;
    stim[61] = 8'h0d;
    stim[62] = 8'h0d;
    stim[63] = 8'h69;
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
      expv[0] = 8'h6e;
      expv[1] = 8'h23;
      expv[2] = 8'h5f;
      expv[3] = 8'ha9;
      expv[4] = 8'h51;
      expv[5] = 8'h20;
      expv[6] = 8'he4;
      expv[7] = 8'he0;
      expv[8] = 8'h40;
      expv[9] = 8'ha4;
      expv[10] = 8'hff;
      expv[11] = 8'h08;
      expv[12] = 8'h1b;
      expv[13] = 8'ha4;
      expv[14] = 8'h9a;
      expv[15] = 8'h64;
      expv[16] = 8'he2;
      expv[17] = 8'h3d;
      expv[18] = 8'h52;
      expv[19] = 8'h38;
      expv[20] = 8'h44;
      expv[21] = 8'h79;
      expv[22] = 8'hba;
      expv[23] = 8'h12;
      expv[24] = 8'h97;
      expv[25] = 8'hdd;
      expv[26] = 8'h70;
      expv[27] = 8'hd6;
      expv[28] = 8'h9e;
      expv[29] = 8'h5e;
      expv[30] = 8'h44;
      expv[31] = 8'h99;
      expv[32] = 8'hfc;
      expv[33] = 8'h91;
      expv[34] = 8'hbb;
      expv[35] = 8'hfb;
      expv[36] = 8'h8c;
      expv[37] = 8'h99;
      expv[38] = 8'h37;
      expv[39] = 8'he0;
      expv[40] = 8'h7c;
      expv[41] = 8'h14;
      expv[42] = 8'h22;
      expv[43] = 8'h1b;
      expv[44] = 8'h35;
      expv[45] = 8'hd2;
      expv[46] = 8'h71;
      expv[47] = 8'h46;
      expv[48] = 8'h86;
      expv[49] = 8'hb6;
      expv[50] = 8'h4f;
      expv[51] = 8'hde;
      expv[52] = 8'h2a;
      expv[53] = 8'hc5;
      expv[54] = 8'h31;
      expv[55] = 8'hbc;
      expv[56] = 8'h38;
      expv[57] = 8'h0f;
      expv[58] = 8'h40;
      expv[59] = 8'hc5;
      expv[60] = 8'hff;
      expv[61] = 8'hf9;
      expv[62] = 8'hf9;
      expv[63] = 8'hfc;
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
