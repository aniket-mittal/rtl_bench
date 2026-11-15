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

  autovcoder_075610 dut (
    .A(in_vec[7:4]),
    .B(in_vec[3:0]),
    .Z(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hcf;
    stim[1] = 8'ha5;
    stim[2] = 8'hfe;
    stim[3] = 8'h72;
    stim[4] = 8'h03;
    stim[5] = 8'h53;
    stim[6] = 8'h53;
    stim[7] = 8'hc5;
    stim[8] = 8'h49;
    stim[9] = 8'hc1;
    stim[10] = 8'hd9;
    stim[11] = 8'h12;
    stim[12] = 8'h21;
    stim[13] = 8'h53;
    stim[14] = 8'h02;
    stim[15] = 8'hff;
    stim[16] = 8'h7a;
    stim[17] = 8'h4f;
    stim[18] = 8'hc7;
    stim[19] = 8'hcf;
    stim[20] = 8'h2d;
    stim[21] = 8'h0c;
    stim[22] = 8'h64;
    stim[23] = 8'hc6;
    stim[24] = 8'h2e;
    stim[25] = 8'h8e;
    stim[26] = 8'h63;
    stim[27] = 8'h1d;
    stim[28] = 8'h51;
    stim[29] = 8'h7d;
    stim[30] = 8'he1;
    stim[31] = 8'h16;
    stim[32] = 8'h9f;
    stim[33] = 8'h8f;
    stim[34] = 8'h65;
    stim[35] = 8'h9e;
    stim[36] = 8'h6f;
    stim[37] = 8'hc5;
    stim[38] = 8'h72;
    stim[39] = 8'ha9;
    stim[40] = 8'h7d;
    stim[41] = 8'h60;
    stim[42] = 8'h1a;
    stim[43] = 8'h58;
    stim[44] = 8'hff;
    stim[45] = 8'h1e;
    stim[46] = 8'hf0;
    stim[47] = 8'h8d;
    stim[48] = 8'h66;
    stim[49] = 8'h1e;
    stim[50] = 8'hb6;
    stim[51] = 8'h66;
    stim[52] = 8'h56;
    stim[53] = 8'h63;
    stim[54] = 8'h23;
    stim[55] = 8'h86;
    stim[56] = 8'h32;
    stim[57] = 8'hb0;
    stim[58] = 8'h15;
    stim[59] = 8'h25;
    stim[60] = 8'haf;
    stim[61] = 8'h76;
    stim[62] = 8'hb8;
    stim[63] = 8'h68;
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
      expv[0] = 8'hb4;
      expv[1] = 8'h32;
      expv[2] = 8'hd2;
      expv[3] = 8'h0e;
      expv[4] = 8'h00;
      expv[5] = 8'h0f;
      expv[6] = 8'h0f;
      expv[7] = 8'h3c;
      expv[8] = 8'h24;
      expv[9] = 8'h0c;
      expv[10] = 8'h75;
      expv[11] = 8'h02;
      expv[12] = 8'h02;
      expv[13] = 8'h0f;
      expv[14] = 8'h00;
      expv[15] = 8'he1;
      expv[16] = 8'h46;
      expv[17] = 8'h3c;
      expv[18] = 8'h54;
      expv[19] = 8'hb4;
      expv[20] = 8'h1a;
      expv[21] = 8'h00;
      expv[22] = 8'h18;
      expv[23] = 8'h48;
      expv[24] = 8'h1c;
      expv[25] = 8'h70;
      expv[26] = 8'h12;
      expv[27] = 8'h0d;
      expv[28] = 8'h05;
      expv[29] = 8'h5b;
      expv[30] = 8'h0e;
      expv[31] = 8'h06;
      expv[32] = 8'h87;
      expv[33] = 8'h78;
      expv[34] = 8'h1e;
      expv[35] = 8'h7e;
      expv[36] = 8'h5a;
      expv[37] = 8'h3c;
      expv[38] = 8'h0e;
      expv[39] = 8'h5a;
      expv[40] = 8'h5b;
      expv[41] = 8'h00;
      expv[42] = 8'h0a;
      expv[43] = 8'h28;
      expv[44] = 8'he1;
      expv[45] = 8'h0e;
      expv[46] = 8'h00;
      expv[47] = 8'h68;
      expv[48] = 8'h24;
      expv[49] = 8'h0e;
      expv[50] = 8'h42;
      expv[51] = 8'h24;
      expv[52] = 8'h1e;
      expv[53] = 8'h12;
      expv[54] = 8'h06;
      expv[55] = 8'h30;
      expv[56] = 8'h06;
      expv[57] = 8'h00;
      expv[58] = 8'h05;
      expv[59] = 8'h0a;
      expv[60] = 8'h96;
      expv[61] = 8'h2a;
      expv[62] = 8'h58;
      expv[63] = 8'h30;
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
