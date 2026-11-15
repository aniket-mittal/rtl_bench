// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_127646 dut (
    .data_in(in_vec[9:2]),
    .ctrl(in_vec[1:0]),
    .data_out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h0bb;
    stim[1] = 10'h2ad;
    stim[2] = 10'h2c8;
    stim[3] = 10'h21b;
    stim[4] = 10'h04e;
    stim[5] = 10'h35f;
    stim[6] = 10'h2c7;
    stim[7] = 10'h252;
    stim[8] = 10'h37a;
    stim[9] = 10'h058;
    stim[10] = 10'h09a;
    stim[11] = 10'h14b;
    stim[12] = 10'h371;
    stim[13] = 10'h16b;
    stim[14] = 10'h2b6;
    stim[15] = 10'h19c;
    stim[16] = 10'h3ce;
    stim[17] = 10'h3a3;
    stim[18] = 10'h1a2;
    stim[19] = 10'h05c;
    stim[20] = 10'h14a;
    stim[21] = 10'h191;
    stim[22] = 10'h127;
    stim[23] = 10'h3f7;
    stim[24] = 10'h079;
    stim[25] = 10'h10f;
    stim[26] = 10'h1de;
    stim[27] = 10'h1d7;
    stim[28] = 10'h1fd;
    stim[29] = 10'h108;
    stim[30] = 10'h258;
    stim[31] = 10'h127;
    stim[32] = 10'h23e;
    stim[33] = 10'h32c;
    stim[34] = 10'h20a;
    stim[35] = 10'h22a;
    stim[36] = 10'h1cd;
    stim[37] = 10'h17e;
    stim[38] = 10'h087;
    stim[39] = 10'h215;
    stim[40] = 10'h34f;
    stim[41] = 10'h3ea;
    stim[42] = 10'h0f7;
    stim[43] = 10'h038;
    stim[44] = 10'h251;
    stim[45] = 10'h107;
    stim[46] = 10'h31e;
    stim[47] = 10'h13a;
    stim[48] = 10'h0bd;
    stim[49] = 10'h3b0;
    stim[50] = 10'h14c;
    stim[51] = 10'h35d;
    stim[52] = 10'h150;
    stim[53] = 10'h390;
    stim[54] = 10'h205;
    stim[55] = 10'h26e;
    stim[56] = 10'h06c;
    stim[57] = 10'h35f;
    stim[58] = 10'h0f2;
    stim[59] = 10'h078;
    stim[60] = 10'h1ee;
    stim[61] = 10'h287;
    stim[62] = 10'h070;
    stim[63] = 10'h396;
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
      expv[0] = 8'h00;
      expv[1] = 8'hab;
      expv[2] = 8'hb2;
      expv[3] = 8'h00;
      expv[4] = 8'h13;
      expv[5] = 8'h00;
      expv[6] = 8'h00;
      expv[7] = 8'h94;
      expv[8] = 8'hde;
      expv[9] = 8'h16;
      expv[10] = 8'h26;
      expv[11] = 8'h00;
      expv[12] = 8'hdc;
      expv[13] = 8'h00;
      expv[14] = 8'had;
      expv[15] = 8'h67;
      expv[16] = 8'hf3;
      expv[17] = 8'h00;
      expv[18] = 8'h68;
      expv[19] = 8'h17;
      expv[20] = 8'h52;
      expv[21] = 8'h64;
      expv[22] = 8'h00;
      expv[23] = 8'h00;
      expv[24] = 8'h1e;
      expv[25] = 8'h00;
      expv[26] = 8'h77;
      expv[27] = 8'h00;
      expv[28] = 8'h7f;
      expv[29] = 8'h42;
      expv[30] = 8'h96;
      expv[31] = 8'h00;
      expv[32] = 8'h8f;
      expv[33] = 8'hcb;
      expv[34] = 8'h82;
      expv[35] = 8'h8a;
      expv[36] = 8'h73;
      expv[37] = 8'h5f;
      expv[38] = 8'h00;
      expv[39] = 8'h85;
      expv[40] = 8'h00;
      expv[41] = 8'hfa;
      expv[42] = 8'h00;
      expv[43] = 8'h0e;
      expv[44] = 8'h94;
      expv[45] = 8'h00;
      expv[46] = 8'hc7;
      expv[47] = 8'h4e;
      expv[48] = 8'h2f;
      expv[49] = 8'hec;
      expv[50] = 8'h53;
      expv[51] = 8'hd7;
      expv[52] = 8'h54;
      expv[53] = 8'he4;
      expv[54] = 8'h81;
      expv[55] = 8'h9b;
      expv[56] = 8'h1b;
      expv[57] = 8'h00;
      expv[58] = 8'h3c;
      expv[59] = 8'h1e;
      expv[60] = 8'h7b;
      expv[61] = 8'h00;
      expv[62] = 8'h1c;
      expv[63] = 8'he5;
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
