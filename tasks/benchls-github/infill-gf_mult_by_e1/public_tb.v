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

  gf_mult_by_e1 dut (
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
    stim[0] = 8'h7d;
    stim[1] = 8'hda;
    stim[2] = 8'h5c;
    stim[3] = 8'h63;
    stim[4] = 8'h30;
    stim[5] = 8'hee;
    stim[6] = 8'h18;
    stim[7] = 8'h84;
    stim[8] = 8'h4e;
    stim[9] = 8'h9b;
    stim[10] = 8'h46;
    stim[11] = 8'hb7;
    stim[12] = 8'hfc;
    stim[13] = 8'hf7;
    stim[14] = 8'h9b;
    stim[15] = 8'h47;
    stim[16] = 8'hd0;
    stim[17] = 8'h46;
    stim[18] = 8'h2a;
    stim[19] = 8'h63;
    stim[20] = 8'hf5;
    stim[21] = 8'h3e;
    stim[22] = 8'h72;
    stim[23] = 8'h1f;
    stim[24] = 8'h09;
    stim[25] = 8'h53;
    stim[26] = 8'h51;
    stim[27] = 8'h24;
    stim[28] = 8'h7f;
    stim[29] = 8'h76;
    stim[30] = 8'h9e;
    stim[31] = 8'h58;
    stim[32] = 8'hc0;
    stim[33] = 8'h27;
    stim[34] = 8'hb4;
    stim[35] = 8'h9e;
    stim[36] = 8'hf7;
    stim[37] = 8'h59;
    stim[38] = 8'h0d;
    stim[39] = 8'haf;
    stim[40] = 8'hcd;
    stim[41] = 8'h05;
    stim[42] = 8'h5a;
    stim[43] = 8'h18;
    stim[44] = 8'hee;
    stim[45] = 8'h4d;
    stim[46] = 8'ha5;
    stim[47] = 8'hfc;
    stim[48] = 8'h47;
    stim[49] = 8'h44;
    stim[50] = 8'h20;
    stim[51] = 8'hcc;
    stim[52] = 8'h42;
    stim[53] = 8'h59;
    stim[54] = 8'h1e;
    stim[55] = 8'h14;
    stim[56] = 8'h98;
    stim[57] = 8'h05;
    stim[58] = 8'h86;
    stim[59] = 8'hfc;
    stim[60] = 8'h55;
    stim[61] = 8'h4b;
    stim[62] = 8'ha2;
    stim[63] = 8'h3b;
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
      expv[0] = 8'h3c;
      expv[1] = 8'h09;
      expv[2] = 8'hac;
      expv[3] = 8'had;
      expv[4] = 8'hc7;
      expv[5] = 8'h6d;
      expv[6] = 8'hed;
      expv[7] = 8'h7a;
      expv[8] = 8'hc5;
      expv[9] = 8'h0a;
      expv[10] = 8'h9e;
      expv[11] = 8'h83;
      expv[12] = 8'h04;
      expv[13] = 8'h61;
      expv[14] = 8'h0a;
      expv[15] = 8'h7f;
      expv[16] = 8'h8d;
      expv[17] = 8'h9e;
      expv[18] = 8'hf5;
      expv[19] = 8'had;
      expv[20] = 8'hbe;
      expv[21] = 8'he0;
      expv[22] = 8'hfa;
      expv[23] = 8'h70;
      expv[24] = 8'hba;
      expv[25] = 8'h6a;
      expv[26] = 8'hb5;
      expv[27] = 8'hd2;
      expv[28] = 8'he3;
      expv[29] = 8'h59;
      expv[30] = 8'h48;
      expv[31] = 8'h0f;
      expv[32] = 8'h3b;
      expv[33] = 8'hec;
      expv[34] = 8'hbd;
      expv[35] = 8'h48;
      expv[36] = 8'h61;
      expv[37] = 8'hee;
      expv[38] = 8'h19;
      expv[39] = 8'h6e;
      expv[40] = 8'h22;
      expv[41] = 8'h42;
      expv[42] = 8'hd0;
      expv[43] = 8'hed;
      expv[44] = 8'h6d;
      expv[45] = 8'hfb;
      expv[46] = 8'hea;
      expv[47] = 8'h04;
      expv[48] = 8'h7f;
      expv[49] = 8'h41;
      expv[50] = 8'h71;
      expv[51] = 8'hc3;
      expv[52] = 8'h3d;
      expv[53] = 8'hee;
      expv[54] = 8'h91;
      expv[55] = 8'h15;
      expv[56] = 8'h34;
      expv[57] = 8'h42;
      expv[58] = 8'ha5;
      expv[59] = 8'h04;
      expv[60] = 8'h16;
      expv[61] = 8'h87;
      expv[62] = 8'h77;
      expv[63] = 8'ha2;
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
