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

  gf_mult_by_96 dut (
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
    stim[0] = 8'h22;
    stim[1] = 8'he7;
    stim[2] = 8'h4b;
    stim[3] = 8'hbe;
    stim[4] = 8'hfe;
    stim[5] = 8'h05;
    stim[6] = 8'h4e;
    stim[7] = 8'hba;
    stim[8] = 8'hfa;
    stim[9] = 8'h91;
    stim[10] = 8'h34;
    stim[11] = 8'h80;
    stim[12] = 8'hab;
    stim[13] = 8'h06;
    stim[14] = 8'h9e;
    stim[15] = 8'hc3;
    stim[16] = 8'h80;
    stim[17] = 8'h05;
    stim[18] = 8'h09;
    stim[19] = 8'h72;
    stim[20] = 8'h57;
    stim[21] = 8'h67;
    stim[22] = 8'h65;
    stim[23] = 8'hd2;
    stim[24] = 8'hac;
    stim[25] = 8'h23;
    stim[26] = 8'h0c;
    stim[27] = 8'h67;
    stim[28] = 8'h8a;
    stim[29] = 8'ha3;
    stim[30] = 8'h6e;
    stim[31] = 8'h2b;
    stim[32] = 8'h6b;
    stim[33] = 8'hda;
    stim[34] = 8'hc7;
    stim[35] = 8'h2f;
    stim[36] = 8'hc2;
    stim[37] = 8'h4b;
    stim[38] = 8'hc3;
    stim[39] = 8'h78;
    stim[40] = 8'h9c;
    stim[41] = 8'h7e;
    stim[42] = 8'h60;
    stim[43] = 8'hc4;
    stim[44] = 8'h8b;
    stim[45] = 8'h15;
    stim[46] = 8'h22;
    stim[47] = 8'hcc;
    stim[48] = 8'h14;
    stim[49] = 8'hb5;
    stim[50] = 8'h53;
    stim[51] = 8'ha1;
    stim[52] = 8'h75;
    stim[53] = 8'hb1;
    stim[54] = 8'h68;
    stim[55] = 8'h94;
    stim[56] = 8'h63;
    stim[57] = 8'hfa;
    stim[58] = 8'h87;
    stim[59] = 8'h93;
    stim[60] = 8'hd6;
    stim[61] = 8'hf3;
    stim[62] = 8'hbc;
    stim[63] = 8'ha1;
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
      expv[0] = 8'h06;
      expv[1] = 8'h40;
      expv[2] = 8'h0d;
      expv[3] = 8'he9;
      expv[4] = 8'h87;
      expv[5] = 8'hf4;
      expv[6] = 8'hf9;
      expv[7] = 8'h8b;
      expv[8] = 8'he5;
      expv[9] = 8'hdf;
      expv[10] = 8'hc0;
      expv[11] = 8'hdc;
      expv[12] = 8'h88;
      expv[13] = 8'h53;
      expv[14] = 8'hde;
      expv[15] = 8'h15;
      expv[16] = 8'hdc;
      expv[17] = 8'hf4;
      expv[18] = 8'h52;
      expv[19] = 8'hfd;
      expv[20] = 8'h3e;
      expv[21] = 8'h9c;
      expv[22] = 8'had;
      expv[23] = 8'h16;
      expv[24] = 8'h4d;
      expv[25] = 8'h90;
      expv[26] = 8'ha6;
      expv[27] = 8'h9c;
      expv[28] = 8'h29;
      expv[29] = 8'h4c;
      expv[30] = 8'hce;
      expv[31] = 8'h54;
      expv[32] = 8'h3a;
      expv[33] = 8'hd2;
      expv[34] = 8'h77;
      expv[35] = 8'h36;
      expv[36] = 8'h83;
      expv[37] = 8'h0d;
      expv[38] = 8'h15;
      expv[39] = 8'h08;
      expv[40] = 8'hef;
      expv[41] = 8'h5b;
      expv[42] = 8'h59;
      expv[43] = 8'hd0;
      expv[44] = 8'hbf;
      expv[45] = 8'h61;
      expv[46] = 8'h06;
      expv[47] = 8'h14;
      expv[48] = 8'hf7;
      expv[49] = 8'h8a;
      expv[50] = 8'h5c;
      expv[51] = 8'h7d;
      expv[52] = 8'h38;
      expv[53] = 8'he8;
      expv[54] = 8'h9d;
      expv[55] = 8'h2b;
      expv[56] = 8'hfe;
      expv[57] = 8'he5;
      expv[58] = 8'h19;
      expv[59] = 8'hee;
      expv[60] = 8'h74;
      expv[61] = 8'hb7;
      expv[62] = 8'hd8;
      expv[63] = 8'h7d;
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
