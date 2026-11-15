// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_061049 dut (
    .i_s(in_vec[22:22]),
    .i_e(in_vec[21:17]),
    .i_f(in_vec[16:0]),
    .o_b(out_vec[21:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h07f5bd;
    stim[1] = 23'h0c71f6;
    stim[2] = 23'h5bef28;
    stim[3] = 23'h45f3d4;
    stim[4] = 23'h0e0690;
    stim[5] = 23'h37f952;
    stim[6] = 23'h2a57d1;
    stim[7] = 23'h47de3b;
    stim[8] = 23'h2ee4ab;
    stim[9] = 23'h21e44c;
    stim[10] = 23'h34b28e;
    stim[11] = 23'h49546d;
    stim[12] = 23'h333053;
    stim[13] = 23'h39db9e;
    stim[14] = 23'h1042e8;
    stim[15] = 23'h2645c9;
    stim[16] = 23'h793312;
    stim[17] = 23'h2e742f;
    stim[18] = 23'h7785a2;
    stim[19] = 23'h0de7f8;
    stim[20] = 23'h267436;
    stim[21] = 23'h1319c5;
    stim[22] = 23'h472829;
    stim[23] = 23'h3a1a9a;
    stim[24] = 23'h48d79f;
    stim[25] = 23'h2b7578;
    stim[26] = 23'h4e8242;
    stim[27] = 23'h443d6e;
    stim[28] = 23'h41411f;
    stim[29] = 23'h76382e;
    stim[30] = 23'h7155b2;
    stim[31] = 23'h1831d8;
    stim[32] = 23'h24de49;
    stim[33] = 23'h3d28d4;
    stim[34] = 23'h28991b;
    stim[35] = 23'h1b7b38;
    stim[36] = 23'h67d258;
    stim[37] = 23'h391fda;
    stim[38] = 23'h324f06;
    stim[39] = 23'h3dd2de;
    stim[40] = 23'h07e7d0;
    stim[41] = 23'h17e617;
    stim[42] = 23'h5a23ab;
    stim[43] = 23'h725ec0;
    stim[44] = 23'h325fb8;
    stim[45] = 23'h66be1c;
    stim[46] = 23'h30939e;
    stim[47] = 23'h6faa4a;
    stim[48] = 23'h5fc9c4;
    stim[49] = 23'h0ec928;
    stim[50] = 23'h4e635e;
    stim[51] = 23'h0d1599;
    stim[52] = 23'h63bda7;
    stim[53] = 23'h3bd7db;
    stim[54] = 23'h1b24db;
    stim[55] = 23'h3e37a4;
    stim[56] = 23'h183bb9;
    stim[57] = 23'h1a8e34;
    stim[58] = 23'h63a31f;
    stim[59] = 23'h339e7a;
    stim[60] = 23'h1bd2d4;
    stim[61] = 23'h238aa0;
    stim[62] = 23'h4ed29b;
    stim[63] = 23'h2ee2ca;
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
      expv[0] = 22'h04fade;
      expv[1] = 22'h05e3ec;
      expv[2] = 22'h2ef794;
      expv[3] = 22'h23f9ea;
      expv[4] = 22'h02d200;
      expv[5] = 22'h1cfca9;
      expv[6] = 22'h14afa2;
      expv[7] = 22'h24ef1d;
      expv[8] = 22'h17e4ab;
      expv[9] = 22'h11f226;
      expv[10] = 22'h1ab28e;
      expv[11] = 22'h25aa36;
      expv[12] = 22'h1a9829;
      expv[13] = 22'h1dedcf;
      expv[14] = 22'h0785d0;
      expv[15] = 22'h128b92;
      expv[16] = 22'h3d9989;
      expv[17] = 22'h16e85e;
      expv[18] = 22'h3cc2d1;
      expv[19] = 22'h07f3fc;
      expv[20] = 22'h12e86c;
      expv[21] = 22'h0a8ce2;
      expv[22] = 22'h249414;
      expv[23] = 22'h1ad4d0;
      expv[24] = 22'h24d79f;
      expv[25] = 22'h16babc;
      expv[26] = 22'h278242;
      expv[27] = 22'h000000;
      expv[28] = 22'h21a08f;
      expv[29] = 22'h39e0b8;
      expv[30] = 22'h39aad9;
      expv[31] = 22'h0ac760;
      expv[32] = 22'h12de49;
      expv[33] = 22'h1f946a;
      expv[34] = 22'h14991b;
      expv[35] = 22'h0ebd9c;
      expv[36] = 22'h34e92c;
      expv[37] = 22'h1d8fed;
      expv[38] = 22'h189e0c;
      expv[39] = 22'h1fe96f;
      expv[40] = 22'h04f3e8;
      expv[41] = 22'h0cf30b;
      expv[42] = 22'h2b8eac;
      expv[43] = 22'h38bd80;
      expv[44] = 22'h18bf70;
      expv[45] = 22'h33be1c;
      expv[46] = 22'h18939e;
      expv[47] = 22'h38d525;
      expv[48] = 22'h30e4e2;
      expv[49] = 22'h07c928;
      expv[50] = 22'h26c6bc;
      expv[51] = 22'h078acc;
      expv[52] = 22'h32ded3;
      expv[53] = 22'h1eebed;
      expv[54] = 22'h0e926d;
      expv[55] = 22'h1dde90;
      expv[56] = 22'h0aeee4;
      expv[57] = 22'h0d8e34;
      expv[58] = 22'h32d18f;
      expv[59] = 22'h1acf3d;
      expv[60] = 22'h0ee96a;
      expv[61] = 22'h12c550;
      expv[62] = 22'h27d29b;
      expv[63] = 22'h17e2ca;
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
