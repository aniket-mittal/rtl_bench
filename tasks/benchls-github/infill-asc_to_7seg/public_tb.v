// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  asc_to_7seg dut (
    .bin(in_vec[7:0]),
    .seg(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h29;
    stim[1] = 8'h41;
    stim[2] = 8'h0e;
    stim[3] = 8'h9b;
    stim[4] = 8'h9b;
    stim[5] = 8'h30;
    stim[6] = 8'h2c;
    stim[7] = 8'hce;
    stim[8] = 8'hdf;
    stim[9] = 8'hfd;
    stim[10] = 8'h1c;
    stim[11] = 8'h2e;
    stim[12] = 8'h48;
    stim[13] = 8'h8c;
    stim[14] = 8'h9d;
    stim[15] = 8'h47;
    stim[16] = 8'h70;
    stim[17] = 8'h3c;
    stim[18] = 8'h70;
    stim[19] = 8'h06;
    stim[20] = 8'h7c;
    stim[21] = 8'h5d;
    stim[22] = 8'he0;
    stim[23] = 8'h86;
    stim[24] = 8'he4;
    stim[25] = 8'hbd;
    stim[26] = 8'hd6;
    stim[27] = 8'h36;
    stim[28] = 8'hfb;
    stim[29] = 8'hc2;
    stim[30] = 8'hac;
    stim[31] = 8'h33;
    stim[32] = 8'hdb;
    stim[33] = 8'h10;
    stim[34] = 8'h37;
    stim[35] = 8'h80;
    stim[36] = 8'h5b;
    stim[37] = 8'h70;
    stim[38] = 8'h2e;
    stim[39] = 8'h21;
    stim[40] = 8'h2e;
    stim[41] = 8'h6f;
    stim[42] = 8'hc5;
    stim[43] = 8'hd1;
    stim[44] = 8'he9;
    stim[45] = 8'h91;
    stim[46] = 8'hc8;
    stim[47] = 8'hc9;
    stim[48] = 8'h5d;
    stim[49] = 8'h98;
    stim[50] = 8'h43;
    stim[51] = 8'h9f;
    stim[52] = 8'haf;
    stim[53] = 8'h51;
    stim[54] = 8'h93;
    stim[55] = 8'hcd;
    stim[56] = 8'h75;
    stim[57] = 8'h8a;
    stim[58] = 8'h45;
    stim[59] = 8'hfe;
    stim[60] = 8'hc4;
    stim[61] = 8'h2e;
    stim[62] = 8'hfc;
    stim[63] = 8'h94;
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
      expv[0] = 7'h7f;
      expv[1] = 7'h08;
      expv[2] = 7'h06;
      expv[3] = 7'h7f;
      expv[4] = 7'h7f;
      expv[5] = 7'h40;
      expv[6] = 7'h7f;
      expv[7] = 7'h7f;
      expv[8] = 7'h7f;
      expv[9] = 7'h7f;
      expv[10] = 7'h7f;
      expv[11] = 7'h7f;
      expv[12] = 7'h0b;
      expv[13] = 7'h7f;
      expv[14] = 7'h7f;
      expv[15] = 7'h10;
      expv[16] = 7'h0c;
      expv[17] = 7'h7f;
      expv[18] = 7'h0c;
      expv[19] = 7'h02;
      expv[20] = 7'h7f;
      expv[21] = 7'h7f;
      expv[22] = 7'h7f;
      expv[23] = 7'h7f;
      expv[24] = 7'h7f;
      expv[25] = 7'h7f;
      expv[26] = 7'h7f;
      expv[27] = 7'h02;
      expv[28] = 7'h7f;
      expv[29] = 7'h7f;
      expv[30] = 7'h7f;
      expv[31] = 7'h30;
      expv[32] = 7'h7f;
      expv[33] = 7'h7f;
      expv[34] = 7'h78;
      expv[35] = 7'h7f;
      expv[36] = 7'h7f;
      expv[37] = 7'h0c;
      expv[38] = 7'h7f;
      expv[39] = 7'h7f;
      expv[40] = 7'h7f;
      expv[41] = 7'h23;
      expv[42] = 7'h7f;
      expv[43] = 7'h7f;
      expv[44] = 7'h7f;
      expv[45] = 7'h7f;
      expv[46] = 7'h7f;
      expv[47] = 7'h7f;
      expv[48] = 7'h7f;
      expv[49] = 7'h7f;
      expv[50] = 7'h46;
      expv[51] = 7'h7f;
      expv[52] = 7'h7f;
      expv[53] = 7'h18;
      expv[54] = 7'h7f;
      expv[55] = 7'h7f;
      expv[56] = 7'h41;
      expv[57] = 7'h7f;
      expv[58] = 7'h06;
      expv[59] = 7'h7f;
      expv[60] = 7'h7f;
      expv[61] = 7'h7f;
      expv[62] = 7'h7f;
      expv[63] = 7'h7f;
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
