// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .d(in_vec[12:12]),
    .done_counting(in_vec[11:11]),
    .ack(in_vec[10:10]),
    .state(in_vec[9:0]),
    .B3_next(out_vec[7:7]),
    .S_next(out_vec[6:6]),
    .S1_next(out_vec[5:5]),
    .Count_next(out_vec[4:4]),
    .Wait_next(out_vec[3:3]),
    .done(out_vec[2:2]),
    .counting(out_vec[1:1]),
    .shift_ena(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h1565;
    stim[1] = 13'h108c;
    stim[2] = 13'h0af1;
    stim[3] = 13'h0a8a;
    stim[4] = 13'h0b6c;
    stim[5] = 13'h04d6;
    stim[6] = 13'h0018;
    stim[7] = 13'h11a2;
    stim[8] = 13'h1314;
    stim[9] = 13'h1db5;
    stim[10] = 13'h1178;
    stim[11] = 13'h1056;
    stim[12] = 13'h10a8;
    stim[13] = 13'h05db;
    stim[14] = 13'h115c;
    stim[15] = 13'h1d56;
    stim[16] = 13'h028e;
    stim[17] = 13'h1bc4;
    stim[18] = 13'h06f8;
    stim[19] = 13'h1e5e;
    stim[20] = 13'h08cc;
    stim[21] = 13'h145c;
    stim[22] = 13'h0c80;
    stim[23] = 13'h0a88;
    stim[24] = 13'h1dfa;
    stim[25] = 13'h1f92;
    stim[26] = 13'h1f6a;
    stim[27] = 13'h1022;
    stim[28] = 13'h0f8a;
    stim[29] = 13'h1018;
    stim[30] = 13'h0735;
    stim[31] = 13'h0366;
    stim[32] = 13'h0267;
    stim[33] = 13'h1a1e;
    stim[34] = 13'h0c92;
    stim[35] = 13'h0382;
    stim[36] = 13'h1d16;
    stim[37] = 13'h0696;
    stim[38] = 13'h0a57;
    stim[39] = 13'h07f8;
    stim[40] = 13'h155a;
    stim[41] = 13'h0bd1;
    stim[42] = 13'h1bd2;
    stim[43] = 13'h0e32;
    stim[44] = 13'h1e2e;
    stim[45] = 13'h0122;
    stim[46] = 13'h1b18;
    stim[47] = 13'h0f41;
    stim[48] = 13'h106f;
    stim[49] = 13'h17d5;
    stim[50] = 13'h09f7;
    stim[51] = 13'h10d5;
    stim[52] = 13'h0ec6;
    stim[53] = 13'h15d4;
    stim[54] = 13'h0b32;
    stim[55] = 13'h1b5f;
    stim[56] = 13'h1ad5;
    stim[57] = 13'h1b2d;
    stim[58] = 13'h1908;
    stim[59] = 13'h031e;
    stim[60] = 13'h00e0;
    stim[61] = 13'h0df4;
    stim[62] = 13'h0202;
    stim[63] = 13'h0802;
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
      expv[0] = 8'hb7;
      expv[1] = 8'h11;
      expv[2] = 8'hd9;
      expv[3] = 8'h59;
      expv[4] = 8'hcf;
      expv[5] = 8'hd1;
      expv[6] = 8'h41;
      expv[7] = 8'h17;
      expv[8] = 8'h1f;
      expv[9] = 8'h3f;
      expv[10] = 8'h97;
      expv[11] = 8'h81;
      expv[12] = 8'h11;
      expv[13] = 8'hd7;
      expv[14] = 8'h97;
      expv[15] = 8'h8f;
      expv[16] = 8'h59;
      expv[17] = 8'h9f;
      expv[18] = 8'hd1;
      expv[19] = 8'hc1;
      expv[20] = 8'hd1;
      expv[21] = 8'h81;
      expv[22] = 8'h11;
      expv[23] = 8'h59;
      expv[24] = 8'h9f;
      expv[25] = 8'h5f;
      expv[26] = 8'hcf;
      expv[27] = 8'h01;
      expv[28] = 8'h5f;
      expv[29] = 8'h01;
      expv[30] = 8'h57;
      expv[31] = 8'hdf;
      expv[32] = 8'hc9;
      expv[33] = 8'h09;
      expv[34] = 8'h51;
      expv[35] = 8'h5f;
      expv[36] = 8'h0f;
      expv[37] = 8'h51;
      expv[38] = 8'hc9;
      expv[39] = 8'hd7;
      expv[40] = 8'h97;
      expv[41] = 8'hdf;
      expv[42] = 8'h9f;
      expv[43] = 8'h41;
      expv[44] = 8'h41;
      expv[45] = 8'h57;
      expv[46] = 8'h0f;
      expv[47] = 8'hcf;
      expv[48] = 8'ha1;
      expv[49] = 8'hf7;
      expv[50] = 8'hdf;
      expv[51] = 8'hb1;
      expv[52] = 8'hd1;
      expv[53] = 8'h97;
      expv[54] = 8'h4f;
      expv[55] = 8'haf;
      expv[56] = 8'hb9;
      expv[57] = 8'h2f;
      expv[58] = 8'h0e;
      expv[59] = 8'h5f;
      expv[60] = 8'h91;
      expv[61] = 8'h9f;
      expv[62] = 8'h48;
      expv[63] = 8'h40;
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
