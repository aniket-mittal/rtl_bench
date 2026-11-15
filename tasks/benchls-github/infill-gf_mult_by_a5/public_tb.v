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

  gf_mult_by_a5 dut (
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
    stim[0] = 8'h21;
    stim[1] = 8'h6f;
    stim[2] = 8'h42;
    stim[3] = 8'h8d;
    stim[4] = 8'heb;
    stim[5] = 8'h2d;
    stim[6] = 8'h8e;
    stim[7] = 8'h8e;
    stim[8] = 8'hdf;
    stim[9] = 8'h32;
    stim[10] = 8'h1b;
    stim[11] = 8'h37;
    stim[12] = 8'hfd;
    stim[13] = 8'h00;
    stim[14] = 8'h69;
    stim[15] = 8'hc1;
    stim[16] = 8'hf7;
    stim[17] = 8'ha0;
    stim[18] = 8'ha3;
    stim[19] = 8'h41;
    stim[20] = 8'hf2;
    stim[21] = 8'hea;
    stim[22] = 8'h20;
    stim[23] = 8'h4c;
    stim[24] = 8'h4d;
    stim[25] = 8'h28;
    stim[26] = 8'h79;
    stim[27] = 8'h16;
    stim[28] = 8'hd5;
    stim[29] = 8'h9b;
    stim[30] = 8'hbd;
    stim[31] = 8'h56;
    stim[32] = 8'hd2;
    stim[33] = 8'hc0;
    stim[34] = 8'hf4;
    stim[35] = 8'hb6;
    stim[36] = 8'he5;
    stim[37] = 8'h38;
    stim[38] = 8'h2b;
    stim[39] = 8'h9c;
    stim[40] = 8'h72;
    stim[41] = 8'hb5;
    stim[42] = 8'ha0;
    stim[43] = 8'h1f;
    stim[44] = 8'h42;
    stim[45] = 8'h47;
    stim[46] = 8'h0f;
    stim[47] = 8'h47;
    stim[48] = 8'h56;
    stim[49] = 8'h22;
    stim[50] = 8'hb1;
    stim[51] = 8'hd1;
    stim[52] = 8'hc7;
    stim[53] = 8'h3e;
    stim[54] = 8'h3b;
    stim[55] = 8'hb5;
    stim[56] = 8'h82;
    stim[57] = 8'hb0;
    stim[58] = 8'hb3;
    stim[59] = 8'hb8;
    stim[60] = 8'hb1;
    stim[61] = 8'h36;
    stim[62] = 8'hee;
    stim[63] = 8'h62;
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
      expv[0] = 8'hbc;
      expv[1] = 8'h36;
      expv[2] = 8'h65;
      expv[3] = 8'h2e;
      expv[4] = 8'hfc;
      expv[5] = 8'h53;
      expv[6] = 8'hdc;
      expv[7] = 8'hdc;
      expv[8] = 8'hc9;
      expv[9] = 8'hcc;
      expv[10] = 8'h31;
      expv[11] = 8'hc7;
      expv[12] = 8'h87;
      expv[13] = 8'h00;
      expv[14] = 8'hcf;
      expv[15] = 8'hf3;
      expv[16] = 8'h91;
      expv[17] = 8'h7d;
      expv[18] = 8'h8f;
      expv[19] = 8'h97;
      expv[20] = 8'h9a;
      expv[21] = 8'h59;
      expv[22] = 8'h19;
      expv[23] = 8'hdd;
      expv[24] = 8'h78;
      expv[25] = 8'h58;
      expv[26] = 8'h4d;
      expv[27] = 8'h7b;
      expv[28] = 8'hdf;
      expv[29] = 8'h55;
      expv[30] = 8'hb5;
      expv[31] = 8'h49;
      expv[32] = 8'h83;
      expv[33] = 8'h56;
      expv[34] = 8'h63;
      expv[35] = 8'h06;
      expv[36] = 8'h44;
      expv[37] = 8'hda;
      expv[38] = 8'haa;
      expv[39] = 8'h09;
      expv[40] = 8'hfe;
      expv[41] = 8'hf4;
      expv[42] = 8'h7d;
      expv[43] = 8'h9f;
      expv[44] = 8'h65;
      expv[45] = 8'h6e;
      expv[46] = 8'h1d;
      expv[47] = 8'h6e;
      expv[48] = 8'h49;
      expv[49] = 8'h4e;
      expv[50] = 8'h5a;
      expv[51] = 8'h71;
      expv[52] = 8'h0a;
      expv[53] = 8'h23;
      expv[54] = 8'h28;
      expv[55] = 8'hf4;
      expv[56] = 8'h33;
      expv[57] = 8'hff;
      expv[58] = 8'h0d;
      expv[59] = 8'hbe;
      expv[60] = 8'h5a;
      expv[61] = 8'h62;
      expv[62] = 8'hf7;
      expv[63] = 8'h7c;
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
