// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_170028 dut (
    .clk(clk),
    .rst_n(in_vec[17:17]),
    .vld_in(in_vec[16:16]),
    .data_in(in_vec[15:0]),
    .quotient(out_vec[18:3]),
    .reminder(out_vec[2:1]),
    .vld_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h1ec55;
    stim[1] = 18'h14d2d;
    stim[2] = 18'h3bb60;
    stim[3] = 18'h39f30;
    stim[4] = 18'h2d136;
    stim[5] = 18'h21283;
    stim[6] = 18'h2f2f6;
    stim[7] = 18'h264a5;
    stim[8] = 18'h2233d;
    stim[9] = 18'h32c45;
    stim[10] = 18'h3a6e9;
    stim[11] = 18'h25b8c;
    stim[12] = 18'h3865c;
    stim[13] = 18'h3bb91;
    stim[14] = 18'h257f6;
    stim[15] = 18'h2fb28;
    stim[16] = 18'h29443;
    stim[17] = 18'h22dfb;
    stim[18] = 18'h33815;
    stim[19] = 18'h20344;
    stim[20] = 18'h329cc;
    stim[21] = 18'h21d55;
    stim[22] = 18'h23142;
    stim[23] = 18'h350e2;
    stim[24] = 18'h3a724;
    stim[25] = 18'h3df73;
    stim[26] = 18'h353ea;
    stim[27] = 18'h24484;
    stim[28] = 18'h380c0;
    stim[29] = 18'h31760;
    stim[30] = 18'h26809;
    stim[31] = 18'h3db60;
    stim[32] = 18'h26d0f;
    stim[33] = 18'h376dd;
    stim[34] = 18'h2219b;
    stim[35] = 18'h288df;
    stim[36] = 18'h32c54;
    stim[37] = 18'h2b994;
    stim[38] = 18'h2f450;
    stim[39] = 18'h31fbf;
    stim[40] = 18'h28f86;
    stim[41] = 18'h315f8;
    stim[42] = 18'h2f756;
    stim[43] = 18'h245dc;
    stim[44] = 18'h2be9d;
    stim[45] = 18'h3d7b5;
    stim[46] = 18'h2632b;
    stim[47] = 18'h28713;
    stim[48] = 18'h258d0;
    stim[49] = 18'h3f70f;
    stim[50] = 18'h3e3ed;
    stim[51] = 18'h34c67;
    stim[52] = 18'h34caf;
    stim[53] = 18'h2a09d;
    stim[54] = 18'h20ffd;
    stim[55] = 18'h38c1f;
    stim[56] = 18'h35dda;
    stim[57] = 18'h372db;
    stim[58] = 18'h3a42d;
    stim[59] = 18'h34c70;
    stim[60] = 18'h3cae3;
    stim[61] = 18'h2138a;
    stim[62] = 18'h2f2f5;
    stim[63] = 18'h37e20;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 19'h00000;
      expv[1] = 19'h00000;
      expv[2] = 19'h00000;
      expv[3] = 19'h00000;
      expv[4] = 19'h00008;
      expv[5] = 19'h00018;
      expv[6] = 19'h00030;
      expv[7] = 19'h00060;
      expv[8] = 19'h000c0;
      expv[9] = 19'h00180;
      expv[10] = 19'h00300;
      expv[11] = 19'h00600;
      expv[12] = 19'h00c08;
      expv[13] = 19'h01810;
      expv[14] = 19'h03028;
      expv[15] = 19'h06058;
      expv[16] = 19'h0c0b0;
      expv[17] = 19'h18160;
      expv[18] = 19'h302c0;
      expv[19] = 19'h60580;
      expv[20] = 19'h40b00;
      expv[21] = 19'h01600;
      expv[22] = 19'h02c00;
      expv[23] = 19'h05800;
      expv[24] = 19'h0b000;
      expv[25] = 19'h16000;
      expv[26] = 19'h2c008;
      expv[27] = 19'h58018;
      expv[28] = 19'h30030;
      expv[29] = 19'h60060;
      expv[30] = 19'h400c8;
      expv[31] = 19'h00190;
      expv[32] = 19'h00320;
      expv[33] = 19'h00648;
      expv[34] = 19'h00c90;
      expv[35] = 19'h01920;
      expv[36] = 19'h03240;
      expv[37] = 19'h06480;
      expv[38] = 19'h0c900;
      expv[39] = 19'h19200;
      expv[40] = 19'h32400;
      expv[41] = 19'h64800;
      expv[42] = 19'h49000;
      expv[43] = 19'h12000;
      expv[44] = 19'h24000;
      expv[45] = 19'h48000;
      expv[46] = 19'h10000;
      expv[47] = 19'h20008;
      expv[48] = 19'h40010;
      expv[49] = 19'h00020;
      expv[50] = 19'h00040;
      expv[51] = 19'h00088;
      expv[52] = 19'h00118;
      expv[53] = 19'h00230;
      expv[54] = 19'h00460;
      expv[55] = 19'h008c0;
      expv[56] = 19'h01180;
      expv[57] = 19'h02308;
      expv[58] = 19'h04610;
      expv[59] = 19'h08c20;
      expv[60] = 19'h11848;
      expv[61] = 19'h23090;
      expv[62] = 19'h46128;
      expv[63] = 19'h0c250;
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
