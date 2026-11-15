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

  gf_mult_by_2c dut (
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
    stim[0] = 8'h0d;
    stim[1] = 8'hbe;
    stim[2] = 8'h25;
    stim[3] = 8'hef;
    stim[4] = 8'hdc;
    stim[5] = 8'h77;
    stim[6] = 8'hff;
    stim[7] = 8'h51;
    stim[8] = 8'h4f;
    stim[9] = 8'h69;
    stim[10] = 8'h36;
    stim[11] = 8'h75;
    stim[12] = 8'h66;
    stim[13] = 8'h41;
    stim[14] = 8'hbb;
    stim[15] = 8'h0d;
    stim[16] = 8'he3;
    stim[17] = 8'hc9;
    stim[18] = 8'h1c;
    stim[19] = 8'hb6;
    stim[20] = 8'hf6;
    stim[21] = 8'hd4;
    stim[22] = 8'h84;
    stim[23] = 8'h1d;
    stim[24] = 8'h16;
    stim[25] = 8'ha4;
    stim[26] = 8'h7a;
    stim[27] = 8'h8b;
    stim[28] = 8'h9a;
    stim[29] = 8'h06;
    stim[30] = 8'hee;
    stim[31] = 8'hb9;
    stim[32] = 8'ha2;
    stim[33] = 8'h08;
    stim[34] = 8'h8d;
    stim[35] = 8'h2c;
    stim[36] = 8'h81;
    stim[37] = 8'hab;
    stim[38] = 8'he7;
    stim[39] = 8'hb4;
    stim[40] = 8'h61;
    stim[41] = 8'h63;
    stim[42] = 8'h33;
    stim[43] = 8'h89;
    stim[44] = 8'h21;
    stim[45] = 8'ha4;
    stim[46] = 8'h0d;
    stim[47] = 8'hf2;
    stim[48] = 8'he8;
    stim[49] = 8'h56;
    stim[50] = 8'h54;
    stim[51] = 8'hdb;
    stim[52] = 8'hc2;
    stim[53] = 8'h8f;
    stim[54] = 8'h04;
    stim[55] = 8'h90;
    stim[56] = 8'h9e;
    stim[57] = 8'hbc;
    stim[58] = 8'haf;
    stim[59] = 8'h14;
    stim[60] = 8'h12;
    stim[61] = 8'h25;
    stim[62] = 8'h9d;
    stim[63] = 8'h1e;
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
      expv[0] = 8'he1;
      expv[1] = 8'h05;
      expv[2] = 8'h75;
      expv[3] = 8'h1c;
      expv[4] = 8'h7b;
      expv[5] = 8'h18;
      expv[6] = 8'he6;
      expv[7] = 8'h19;
      expv[8] = 8'h76;
      expv[9] = 8'h77;
      expv[10] = 8'hfb;
      expv[11] = 8'h40;
      expv[12] = 8'hce;
      expv[13] = 8'he3;
      expv[14] = 8'h99;
      expv[15] = 8'he1;
      expv[16] = 8'hd1;
      expv[17] = 8'h1d;
      expv[18] = 8'h37;
      expv[19] = 8'h78;
      expv[20] = 8'hb7;
      expv[21] = 8'h06;
      expv[22] = 8'h33;
      expv[23] = 8'h1b;
      expv[24] = 8'h12;
      expv[25] = 8'hda;
      expv[26] = 8'hf9;
      expv[27] = 8'h8a;
      expv[28] = 8'h5c;
      expv[29] = 8'he8;
      expv[30] = 8'h30;
      expv[31] = 8'hc1;
      expv[32] = 8'h32;
      expv[33] = 8'h7d;
      expv[34] = 8'h62;
      expv[35] = 8'h24;
      expv[36] = 8'haf;
      expv[37] = 8'h63;
      expv[38] = 8'h61;
      expv[39] = 8'h20;
      expv[40] = 8'h0a;
      expv[41] = 8'h52;
      expv[42] = 8'h67;
      expv[43] = 8'hd2;
      expv[44] = 8'hc5;
      expv[45] = 8'hda;
      expv[46] = 8'he1;
      expv[47] = 8'h07;
      expv[48] = 8'hd8;
      expv[49] = 8'hdd;
      expv[50] = 8'h85;
      expv[51] = 8'hbf;
      expv[52] = 8'h14;
      expv[53] = 8'h3a;
      expv[54] = 8'hb0;
      expv[55] = 8'h79;
      expv[56] = 8'hec;
      expv[57] = 8'h5d;
      expv[58] = 8'hd3;
      expv[59] = 8'h4a;
      expv[60] = 8'ha2;
      expv[61] = 8'h75;
      expv[62] = 8'h98;
      expv[63] = 8'h6f;
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
