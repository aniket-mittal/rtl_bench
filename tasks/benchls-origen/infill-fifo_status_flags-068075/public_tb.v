// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_068075 dut (
    .diff_ptr(in_vec[7:0]),
    .full_flag(out_vec[4:4]),
    .empty_flag(out_vec[3:3]),
    .almost_empty(out_vec[2:2]),
    .almost_full(out_vec[1:1]),
    .half_flag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'he5;
    stim[1] = 8'h7f;
    stim[2] = 8'h33;
    stim[3] = 8'ha5;
    stim[4] = 8'ha7;
    stim[5] = 8'h4b;
    stim[6] = 8'he0;
    stim[7] = 8'h92;
    stim[8] = 8'ha9;
    stim[9] = 8'hd5;
    stim[10] = 8'hcc;
    stim[11] = 8'h02;
    stim[12] = 8'h9d;
    stim[13] = 8'h01;
    stim[14] = 8'ha6;
    stim[15] = 8'ha4;
    stim[16] = 8'h45;
    stim[17] = 8'h99;
    stim[18] = 8'h3e;
    stim[19] = 8'hf5;
    stim[20] = 8'hb8;
    stim[21] = 8'hc9;
    stim[22] = 8'hb2;
    stim[23] = 8'h7a;
    stim[24] = 8'h7b;
    stim[25] = 8'h32;
    stim[26] = 8'h8a;
    stim[27] = 8'he4;
    stim[28] = 8'hc8;
    stim[29] = 8'h16;
    stim[30] = 8'h7f;
    stim[31] = 8'hf2;
    stim[32] = 8'he1;
    stim[33] = 8'hc3;
    stim[34] = 8'hc1;
    stim[35] = 8'hc3;
    stim[36] = 8'h8f;
    stim[37] = 8'hb7;
    stim[38] = 8'hf3;
    stim[39] = 8'he5;
    stim[40] = 8'hb4;
    stim[41] = 8'h11;
    stim[42] = 8'h94;
    stim[43] = 8'h9f;
    stim[44] = 8'h1e;
    stim[45] = 8'hf1;
    stim[46] = 8'he4;
    stim[47] = 8'h0d;
    stim[48] = 8'h1b;
    stim[49] = 8'h5a;
    stim[50] = 8'hf9;
    stim[51] = 8'hd8;
    stim[52] = 8'h7e;
    stim[53] = 8'h39;
    stim[54] = 8'hc6;
    stim[55] = 8'h6f;
    stim[56] = 8'h4f;
    stim[57] = 8'h52;
    stim[58] = 8'h59;
    stim[59] = 8'hb1;
    stim[60] = 8'h38;
    stim[61] = 8'hfa;
    stim[62] = 8'he2;
    stim[63] = 8'h37;
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
      expv[0] = 5'h00;
      expv[1] = 5'h01;
      expv[2] = 5'h00;
      expv[3] = 5'h00;
      expv[4] = 5'h00;
      expv[5] = 5'h00;
      expv[6] = 5'h00;
      expv[7] = 5'h00;
      expv[8] = 5'h00;
      expv[9] = 5'h00;
      expv[10] = 5'h00;
      expv[11] = 5'h04;
      expv[12] = 5'h00;
      expv[13] = 5'h04;
      expv[14] = 5'h00;
      expv[15] = 5'h00;
      expv[16] = 5'h00;
      expv[17] = 5'h00;
      expv[18] = 5'h00;
      expv[19] = 5'h00;
      expv[20] = 5'h00;
      expv[21] = 5'h00;
      expv[22] = 5'h00;
      expv[23] = 5'h00;
      expv[24] = 5'h00;
      expv[25] = 5'h00;
      expv[26] = 5'h00;
      expv[27] = 5'h00;
      expv[28] = 5'h00;
      expv[29] = 5'h00;
      expv[30] = 5'h01;
      expv[31] = 5'h00;
      expv[32] = 5'h00;
      expv[33] = 5'h00;
      expv[34] = 5'h00;
      expv[35] = 5'h00;
      expv[36] = 5'h00;
      expv[37] = 5'h00;
      expv[38] = 5'h00;
      expv[39] = 5'h00;
      expv[40] = 5'h00;
      expv[41] = 5'h00;
      expv[42] = 5'h00;
      expv[43] = 5'h00;
      expv[44] = 5'h00;
      expv[45] = 5'h00;
      expv[46] = 5'h00;
      expv[47] = 5'h00;
      expv[48] = 5'h00;
      expv[49] = 5'h00;
      expv[50] = 5'h02;
      expv[51] = 5'h00;
      expv[52] = 5'h00;
      expv[53] = 5'h00;
      expv[54] = 5'h00;
      expv[55] = 5'h00;
      expv[56] = 5'h00;
      expv[57] = 5'h00;
      expv[58] = 5'h00;
      expv[59] = 5'h00;
      expv[60] = 5'h00;
      expv[61] = 5'h02;
      expv[62] = 5'h00;
      expv[63] = 5'h00;
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
