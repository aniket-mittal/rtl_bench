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

  gf_mult_by_4c dut (
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
    stim[0] = 8'h3f;
    stim[1] = 8'hf9;
    stim[2] = 8'haf;
    stim[3] = 8'h47;
    stim[4] = 8'h5f;
    stim[5] = 8'h38;
    stim[6] = 8'h4b;
    stim[7] = 8'hec;
    stim[8] = 8'h79;
    stim[9] = 8'h45;
    stim[10] = 8'ha2;
    stim[11] = 8'h58;
    stim[12] = 8'h09;
    stim[13] = 8'h2b;
    stim[14] = 8'h98;
    stim[15] = 8'h8c;
    stim[16] = 8'ha4;
    stim[17] = 8'h70;
    stim[18] = 8'h70;
    stim[19] = 8'h99;
    stim[20] = 8'hf8;
    stim[21] = 8'h9c;
    stim[22] = 8'h3d;
    stim[23] = 8'h00;
    stim[24] = 8'h3c;
    stim[25] = 8'h0e;
    stim[26] = 8'hf5;
    stim[27] = 8'hdd;
    stim[28] = 8'h82;
    stim[29] = 8'h5b;
    stim[30] = 8'h26;
    stim[31] = 8'hd6;
    stim[32] = 8'h11;
    stim[33] = 8'he2;
    stim[34] = 8'h45;
    stim[35] = 8'hb7;
    stim[36] = 8'h19;
    stim[37] = 8'hde;
    stim[38] = 8'h62;
    stim[39] = 8'h6e;
    stim[40] = 8'h52;
    stim[41] = 8'hf1;
    stim[42] = 8'h3c;
    stim[43] = 8'hf1;
    stim[44] = 8'h65;
    stim[45] = 8'h61;
    stim[46] = 8'h97;
    stim[47] = 8'h98;
    stim[48] = 8'h38;
    stim[49] = 8'h81;
    stim[50] = 8'hc5;
    stim[51] = 8'h04;
    stim[52] = 8'h3a;
    stim[53] = 8'hf7;
    stim[54] = 8'hf5;
    stim[55] = 8'h16;
    stim[56] = 8'h77;
    stim[57] = 8'hda;
    stim[58] = 8'hff;
    stim[59] = 8'h61;
    stim[60] = 8'h87;
    stim[61] = 8'h36;
    stim[62] = 8'hba;
    stim[63] = 8'h22;
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
      expv[0] = 8'h62;
      expv[1] = 8'hf4;
      expv[2] = 8'h1f;
      expv[3] = 8'h13;
      expv[4] = 8'hfd;
      expv[5] = 8'h9b;
      expv[6] = 8'h64;
      expv[7] = 8'h21;
      expv[8] = 8'h3d;
      expv[9] = 8'h8b;
      expv[10] = 8'h24;
      expv[11] = 8'h04;
      expv[12] = 8'h16;
      expv[13] = 8'hfb;
      expv[14] = 8'h27;
      expv[15] = 8'hbe;
      expv[16] = 8'h91;
      expv[17] = 8'h2b;
      expv[18] = 8'h2b;
      expv[19] = 8'h6b;
      expv[20] = 8'hb8;
      expv[21] = 8'h0a;
      expv[22] = 8'hfa;
      expv[23] = 8'h00;
      expv[24] = 8'hb6;
      expv[25] = 8'hef;
      expv[26] = 8'h83;
      expv[27] = 8'hac;
      expv[28] = 8'h51;
      expv[29] = 8'hd0;
      expv[30] = 8'hc0;
      expv[31] = 8'h22;
      expv[32] = 8'hf8;
      expv[33] = 8'hce;
      expv[34] = 8'h8b;
      expv[35] = 8'hf1;
      expv[36] = 8'ha2;
      expv[37] = 8'h78;
      expv[38] = 8'h07;
      expv[39] = 8'h70;
      expv[40] = 8'hc6;
      expv[41] = 8'hae;
      expv[42] = 8'hb6;
      expv[43] = 8'hae;
      expv[44] = 8'hfe;
      expv[45] = 8'hd3;
      expv[46] = 8'h84;
      expv[47] = 8'h27;
      expv[48] = 8'h9b;
      expv[49] = 8'h85;
      expv[50] = 8'h42;
      expv[51] = 8'h2d;
      expv[52] = 8'h03;
      expv[53] = 8'h1b;
      expv[54] = 8'h83;
      expv[55] = 8'h01;
      expv[56] = 8'hd2;
      expv[57] = 8'h55;
      expv[58] = 8'h41;
      expv[59] = 8'hd3;
      expv[60] = 8'h30;
      expv[61] = 8'h74;
      expv[62] = 8'hca;
      expv[63] = 8'hed;
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
