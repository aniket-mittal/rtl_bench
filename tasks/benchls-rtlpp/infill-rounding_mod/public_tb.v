// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rounding_mod dut (
    .data_in(in_vec[15:0]),
    .data_out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h0d24;
    stim[1] = 16'hba9b;
    stim[2] = 16'h071b;
    stim[3] = 16'hd6da;
    stim[4] = 16'h9371;
    stim[5] = 16'hbb36;
    stim[6] = 16'hc680;
    stim[7] = 16'h11e0;
    stim[8] = 16'h159f;
    stim[9] = 16'h9fd7;
    stim[10] = 16'h0637;
    stim[11] = 16'h5069;
    stim[12] = 16'h8317;
    stim[13] = 16'hae3b;
    stim[14] = 16'ha716;
    stim[15] = 16'h9c31;
    stim[16] = 16'hed30;
    stim[17] = 16'h8d44;
    stim[18] = 16'hdbe5;
    stim[19] = 16'hae63;
    stim[20] = 16'h6b7e;
    stim[21] = 16'h1c95;
    stim[22] = 16'h95f3;
    stim[23] = 16'hc8fd;
    stim[24] = 16'hd032;
    stim[25] = 16'h7e0c;
    stim[26] = 16'h4303;
    stim[27] = 16'h348c;
    stim[28] = 16'haa55;
    stim[29] = 16'hb628;
    stim[30] = 16'h5c26;
    stim[31] = 16'h4f47;
    stim[32] = 16'ha366;
    stim[33] = 16'h08d9;
    stim[34] = 16'h70cb;
    stim[35] = 16'hf351;
    stim[36] = 16'hf2f0;
    stim[37] = 16'h1047;
    stim[38] = 16'h2ce9;
    stim[39] = 16'h08de;
    stim[40] = 16'h0647;
    stim[41] = 16'hb2c7;
    stim[42] = 16'hf718;
    stim[43] = 16'hd93f;
    stim[44] = 16'h33ea;
    stim[45] = 16'he1ce;
    stim[46] = 16'h3665;
    stim[47] = 16'hf08d;
    stim[48] = 16'hf2ce;
    stim[49] = 16'h1897;
    stim[50] = 16'h6616;
    stim[51] = 16'hf284;
    stim[52] = 16'hf7bc;
    stim[53] = 16'hf25a;
    stim[54] = 16'hae4e;
    stim[55] = 16'h114c;
    stim[56] = 16'h8dff;
    stim[57] = 16'hfea3;
    stim[58] = 16'h9513;
    stim[59] = 16'hf77a;
    stim[60] = 16'h17f9;
    stim[61] = 16'h95d2;
    stim[62] = 16'hc591;
    stim[63] = 16'h18ac;
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
      expv[0] = 16'h1000;
      expv[1] = 16'h8000;
      expv[2] = 16'h0800;
      expv[3] = 16'h0000;
      expv[4] = 16'h8000;
      expv[5] = 16'h8000;
      expv[6] = 16'h0000;
      expv[7] = 16'h1000;
      expv[8] = 16'h1000;
      expv[9] = 16'h8000;
      expv[10] = 16'h0800;
      expv[11] = 16'h4000;
      expv[12] = 16'h8000;
      expv[13] = 16'h8000;
      expv[14] = 16'h8000;
      expv[15] = 16'h8000;
      expv[16] = 16'h0000;
      expv[17] = 16'h8000;
      expv[18] = 16'h0000;
      expv[19] = 16'h8000;
      expv[20] = 16'h8000;
      expv[21] = 16'h2000;
      expv[22] = 16'h8000;
      expv[23] = 16'h0000;
      expv[24] = 16'h0000;
      expv[25] = 16'h8000;
      expv[26] = 16'h4000;
      expv[27] = 16'h4000;
      expv[28] = 16'h8000;
      expv[29] = 16'h8000;
      expv[30] = 16'h4000;
      expv[31] = 16'h4000;
      expv[32] = 16'h8000;
      expv[33] = 16'h0800;
      expv[34] = 16'h8000;
      expv[35] = 16'h0000;
      expv[36] = 16'h0000;
      expv[37] = 16'h1000;
      expv[38] = 16'h2000;
      expv[39] = 16'h0800;
      expv[40] = 16'h0800;
      expv[41] = 16'h8000;
      expv[42] = 16'h0000;
      expv[43] = 16'h0000;
      expv[44] = 16'h4000;
      expv[45] = 16'h0000;
      expv[46] = 16'h4000;
      expv[47] = 16'h0000;
      expv[48] = 16'h0000;
      expv[49] = 16'h2000;
      expv[50] = 16'h8000;
      expv[51] = 16'h0000;
      expv[52] = 16'h0000;
      expv[53] = 16'h0000;
      expv[54] = 16'h8000;
      expv[55] = 16'h1000;
      expv[56] = 16'h8000;
      expv[57] = 16'h0000;
      expv[58] = 16'h8000;
      expv[59] = 16'h0000;
      expv[60] = 16'h1000;
      expv[61] = 16'h8000;
      expv[62] = 16'h0000;
      expv[63] = 16'h2000;
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
