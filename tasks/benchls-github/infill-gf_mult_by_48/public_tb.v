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

  gf_mult_by_48 dut (
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
    stim[0] = 8'hc4;
    stim[1] = 8'hfa;
    stim[2] = 8'hf5;
    stim[3] = 8'h6b;
    stim[4] = 8'ha2;
    stim[5] = 8'h06;
    stim[6] = 8'hf8;
    stim[7] = 8'h7a;
    stim[8] = 8'h33;
    stim[9] = 8'he0;
    stim[10] = 8'h5a;
    stim[11] = 8'h58;
    stim[12] = 8'h3f;
    stim[13] = 8'h94;
    stim[14] = 8'hec;
    stim[15] = 8'hef;
    stim[16] = 8'h99;
    stim[17] = 8'h1f;
    stim[18] = 8'h90;
    stim[19] = 8'h7d;
    stim[20] = 8'hc6;
    stim[21] = 8'h87;
    stim[22] = 8'h62;
    stim[23] = 8'h1c;
    stim[24] = 8'h23;
    stim[25] = 8'h4e;
    stim[26] = 8'h37;
    stim[27] = 8'h52;
    stim[28] = 8'h4a;
    stim[29] = 8'h21;
    stim[30] = 8'h1c;
    stim[31] = 8'hc4;
    stim[32] = 8'h37;
    stim[33] = 8'hda;
    stim[34] = 8'h1c;
    stim[35] = 8'h91;
    stim[36] = 8'h3e;
    stim[37] = 8'h6f;
    stim[38] = 8'heb;
    stim[39] = 8'hd0;
    stim[40] = 8'hbd;
    stim[41] = 8'h98;
    stim[42] = 8'hb8;
    stim[43] = 8'h43;
    stim[44] = 8'h8d;
    stim[45] = 8'h21;
    stim[46] = 8'h52;
    stim[47] = 8'h8f;
    stim[48] = 8'hd9;
    stim[49] = 8'hdf;
    stim[50] = 8'hd1;
    stim[51] = 8'hd7;
    stim[52] = 8'h60;
    stim[53] = 8'h92;
    stim[54] = 8'hcf;
    stim[55] = 8'h5d;
    stim[56] = 8'h86;
    stim[57] = 8'h6a;
    stim[58] = 8'hcb;
    stim[59] = 8'hfa;
    stim[60] = 8'hc0;
    stim[61] = 8'ha8;
    stim[62] = 8'hf2;
    stim[63] = 8'h08;
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
      expv[0] = 8'h39;
      expv[1] = 8'hef;
      expv[2] = 8'h70;
      expv[3] = 8'ha0;
      expv[4] = 8'h96;
      expv[5] = 8'had;
      expv[6] = 8'h7f;
      expv[7] = 8'h1c;
      expv[8] = 8'hd9;
      expv[9] = 8'hf1;
      expv[10] = 8'he9;
      expv[11] = 8'h79;
      expv[12] = 8'h9e;
      expv[13] = 8'h3a;
      expv[14] = 8'hb6;
      expv[15] = 8'h6e;
      expv[16] = 8'h35;
      expv[17] = 8'h6b;
      expv[18] = 8'h07;
      expv[19] = 8'hf9;
      expv[20] = 8'ha9;
      expv[21] = 8'h16;
      expv[22] = 8'h92;
      expv[23] = 8'hb3;
      expv[24] = 8'h2d;
      expv[25] = 8'h20;
      expv[26] = 8'he4;
      expv[27] = 8'h93;
      expv[28] = 8'h1d;
      expv[29] = 8'hbd;
      expv[30] = 8'hb3;
      expv[31] = 8'h39;
      expv[32] = 8'he4;
      expv[33] = 8'h1a;
      expv[34] = 8'hb3;
      expv[35] = 8'h4f;
      expv[36] = 8'hd6;
      expv[37] = 8'h9d;
      expv[38] = 8'h53;
      expv[39] = 8'hf0;
      expv[40] = 8'hfd;
      expv[41] = 8'h7d;
      expv[42] = 8'h88;
      expv[43] = 8'h2f;
      expv[44] = 8'hfc;
      expv[45] = 8'hbd;
      expv[46] = 8'h93;
      expv[47] = 8'h6c;
      expv[48] = 8'hc2;
      expv[49] = 8'h6f;
      expv[50] = 8'hb8;
      expv[51] = 8'h15;
      expv[52] = 8'h02;
      expv[53] = 8'h97;
      expv[54] = 8'h9b;
      expv[55] = 8'h0c;
      expv[56] = 8'h5e;
      expv[57] = 8'he8;
      expv[58] = 8'ha6;
      expv[59] = 8'hef;
      expv[60] = 8'h04;
      expv[61] = 8'h7c;
      expv[62] = 8'h95;
      expv[63] = 8'h7a;
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
