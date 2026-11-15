// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_007067 dut (
    .fil(in_vec[7:4]),
    .col(in_vec[3:0]),
    .tecla(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h78;
    stim[1] = 8'h05;
    stim[2] = 8'he3;
    stim[3] = 8'h6e;
    stim[4] = 8'h52;
    stim[5] = 8'hbb;
    stim[6] = 8'h1d;
    stim[7] = 8'h90;
    stim[8] = 8'h75;
    stim[9] = 8'h5a;
    stim[10] = 8'h44;
    stim[11] = 8'hcd;
    stim[12] = 8'h98;
    stim[13] = 8'h5e;
    stim[14] = 8'hfd;
    stim[15] = 8'h77;
    stim[16] = 8'hfd;
    stim[17] = 8'hbe;
    stim[18] = 8'h09;
    stim[19] = 8'h16;
    stim[20] = 8'he2;
    stim[21] = 8'h2c;
    stim[22] = 8'h79;
    stim[23] = 8'h19;
    stim[24] = 8'h3b;
    stim[25] = 8'h61;
    stim[26] = 8'h5c;
    stim[27] = 8'h39;
    stim[28] = 8'he1;
    stim[29] = 8'hce;
    stim[30] = 8'h4f;
    stim[31] = 8'h07;
    stim[32] = 8'hdd;
    stim[33] = 8'h31;
    stim[34] = 8'hea;
    stim[35] = 8'h93;
    stim[36] = 8'h30;
    stim[37] = 8'hd0;
    stim[38] = 8'h09;
    stim[39] = 8'h9a;
    stim[40] = 8'h67;
    stim[41] = 8'h03;
    stim[42] = 8'h9f;
    stim[43] = 8'h60;
    stim[44] = 8'hcb;
    stim[45] = 8'h65;
    stim[46] = 8'hab;
    stim[47] = 8'h98;
    stim[48] = 8'h4a;
    stim[49] = 8'h15;
    stim[50] = 8'h00;
    stim[51] = 8'h69;
    stim[52] = 8'h79;
    stim[53] = 8'h25;
    stim[54] = 8'ha0;
    stim[55] = 8'h70;
    stim[56] = 8'ha6;
    stim[57] = 8'h9d;
    stim[58] = 8'hb1;
    stim[59] = 8'h75;
    stim[60] = 8'hb3;
    stim[61] = 8'h06;
    stim[62] = 8'h50;
    stim[63] = 8'h15;
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
      expv[0] = 4'hf;
      expv[1] = 4'hf;
      expv[2] = 4'hf;
      expv[3] = 4'hf;
      expv[4] = 4'hf;
      expv[5] = 4'hf;
      expv[6] = 4'h0;
      expv[7] = 4'hf;
      expv[8] = 4'hf;
      expv[9] = 4'hf;
      expv[10] = 4'ha;
      expv[11] = 4'hf;
      expv[12] = 4'hf;
      expv[13] = 4'hf;
      expv[14] = 4'hf;
      expv[15] = 4'hf;
      expv[16] = 4'hf;
      expv[17] = 4'hf;
      expv[18] = 4'hf;
      expv[19] = 4'h1;
      expv[20] = 4'hf;
      expv[21] = 4'h6;
      expv[22] = 4'hf;
      expv[23] = 4'h0;
      expv[24] = 4'hf;
      expv[25] = 4'hf;
      expv[26] = 4'hf;
      expv[27] = 4'hf;
      expv[28] = 4'hf;
      expv[29] = 4'hf;
      expv[30] = 4'h8;
      expv[31] = 4'hf;
      expv[32] = 4'hf;
      expv[33] = 4'hf;
      expv[34] = 4'hf;
      expv[35] = 4'hf;
      expv[36] = 4'hf;
      expv[37] = 4'hf;
      expv[38] = 4'hf;
      expv[39] = 4'hf;
      expv[40] = 4'hf;
      expv[41] = 4'hf;
      expv[42] = 4'hf;
      expv[43] = 4'hf;
      expv[44] = 4'hf;
      expv[45] = 4'hf;
      expv[46] = 4'hf;
      expv[47] = 4'hf;
      expv[48] = 4'h9;
      expv[49] = 4'h0;
      expv[50] = 4'hf;
      expv[51] = 4'hf;
      expv[52] = 4'hf;
      expv[53] = 4'h4;
      expv[54] = 4'hf;
      expv[55] = 4'hf;
      expv[56] = 4'hf;
      expv[57] = 4'hf;
      expv[58] = 4'hf;
      expv[59] = 4'hf;
      expv[60] = 4'hf;
      expv[61] = 4'hf;
      expv[62] = 4'hf;
      expv[63] = 4'h0;
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
