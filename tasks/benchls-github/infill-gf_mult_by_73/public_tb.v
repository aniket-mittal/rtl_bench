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

  gf_mult_by_73 dut (
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
    stim[0] = 8'h56;
    stim[1] = 8'h62;
    stim[2] = 8'hf6;
    stim[3] = 8'hd8;
    stim[4] = 8'hb3;
    stim[5] = 8'he9;
    stim[6] = 8'h6b;
    stim[7] = 8'h1f;
    stim[8] = 8'h3b;
    stim[9] = 8'ha8;
    stim[10] = 8'ha4;
    stim[11] = 8'ha3;
    stim[12] = 8'h66;
    stim[13] = 8'h3b;
    stim[14] = 8'h58;
    stim[15] = 8'h9c;
    stim[16] = 8'h5f;
    stim[17] = 8'h87;
    stim[18] = 8'he9;
    stim[19] = 8'hc2;
    stim[20] = 8'h3a;
    stim[21] = 8'h19;
    stim[22] = 8'h2a;
    stim[23] = 8'hb0;
    stim[24] = 8'hf6;
    stim[25] = 8'h8e;
    stim[26] = 8'h6e;
    stim[27] = 8'ha8;
    stim[28] = 8'hb9;
    stim[29] = 8'h12;
    stim[30] = 8'hc2;
    stim[31] = 8'h20;
    stim[32] = 8'had;
    stim[33] = 8'hf5;
    stim[34] = 8'hd3;
    stim[35] = 8'h99;
    stim[36] = 8'hcc;
    stim[37] = 8'h72;
    stim[38] = 8'h4d;
    stim[39] = 8'h32;
    stim[40] = 8'h48;
    stim[41] = 8'h0b;
    stim[42] = 8'hb5;
    stim[43] = 8'hb8;
    stim[44] = 8'hc9;
    stim[45] = 8'h73;
    stim[46] = 8'h99;
    stim[47] = 8'hc6;
    stim[48] = 8'hc0;
    stim[49] = 8'h04;
    stim[50] = 8'hc5;
    stim[51] = 8'h57;
    stim[52] = 8'h2e;
    stim[53] = 8'hc6;
    stim[54] = 8'h36;
    stim[55] = 8'hf6;
    stim[56] = 8'h87;
    stim[57] = 8'h76;
    stim[58] = 8'h74;
    stim[59] = 8'h8a;
    stim[60] = 8'hc1;
    stim[61] = 8'h8e;
    stim[62] = 8'hc4;
    stim[63] = 8'h4d;
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
      expv[0] = 8'hc5;
      expv[1] = 8'hb1;
      expv[2] = 8'h3c;
      expv[3] = 8'h72;
      expv[4] = 8'h0f;
      expv[5] = 8'ha4;
      expv[6] = 8'h7d;
      expv[7] = 8'h98;
      expv[8] = 8'h8f;
      expv[9] = 8'h46;
      expv[10] = 8'h28;
      expv[11] = 8'h6c;
      expv[12] = 8'h60;
      expv[13] = 8'h8f;
      expv[14] = 8'h4d;
      expv[15] = 8'h32;
      expv[16] = 8'h09;
      expv[17] = 8'h7b;
      expv[18] = 8'ha4;
      expv[19] = 8'h48;
      expv[20] = 8'hfc;
      expv[21] = 8'haf;
      expv[22] = 8'h9f;
      expv[23] = 8'h9a;
      expv[24] = 8'h3c;
      expv[25] = 8'hb7;
      expv[26] = 8'hdf;
      expv[27] = 8'h46;
      expv[28] = 8'h56;
      expv[29] = 8'h85;
      expv[30] = 8'h48;
      expv[31] = 8'hc6;
      expv[32] = 8'he4;
      expv[33] = 8'ha9;
      expv[34] = 8'h58;
      expv[35] = 8'h90;
      expv[36] = 8'hc0;
      expv[37] = 8'hd2;
      expv[38] = 8'h8c;
      expv[39] = 8'h43;
      expv[40] = 8'h2e;
      expv[41] = 8'h2a;
      expv[42] = 8'h38;
      expv[43] = 8'h25;
      expv[44] = 8'h62;
      expv[45] = 8'ha1;
      expv[46] = 8'h90;
      expv[47] = 8'h99;
      expv[48] = 8'hae;
      expv[49] = 8'hd1;
      expv[50] = 8'h0c;
      expv[51] = 8'hb6;
      expv[52] = 8'h4e;
      expv[53] = 8'h99;
      expv[54] = 8'h92;
      expv[55] = 8'h3c;
      expv[56] = 8'h7b;
      expv[57] = 8'h03;
      expv[58] = 8'he5;
      expv[59] = 8'h66;
      expv[60] = 8'hdd;
      expv[61] = 8'hb7;
      expv[62] = 8'h7f;
      expv[63] = 8'h8c;
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
