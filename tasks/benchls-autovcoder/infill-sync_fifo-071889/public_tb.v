// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_071889 dut (
    .sclk(clk),
    .reset(in_vec[11:11]),
    .sclk_en(in_vec[10:10]),
    .rdreq(in_vec[9:9]),
    .wrreq(in_vec[8:8]),
    .data(in_vec[7:0]),
    .empty_n(out_vec[9:9]),
    .full_n(out_vec[8:8]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hbf4;
    stim[1] = 12'hf1f;
    stim[2] = 12'h6f2;
    stim[3] = 12'h080;
    stim[4] = 12'h507;
    stim[5] = 12'h587;
    stim[6] = 12'h74b;
    stim[7] = 12'h7a5;
    stim[8] = 12'h7ae;
    stim[9] = 12'h799;
    stim[10] = 12'h10d;
    stim[11] = 12'h640;
    stim[12] = 12'h145;
    stim[13] = 12'h0cc;
    stim[14] = 12'h32d;
    stim[15] = 12'h45e;
    stim[16] = 12'h16e;
    stim[17] = 12'h1f0;
    stim[18] = 12'h725;
    stim[19] = 12'h732;
    stim[20] = 12'h79d;
    stim[21] = 12'h04d;
    stim[22] = 12'h0ef;
    stim[23] = 12'h771;
    stim[24] = 12'h3ef;
    stim[25] = 12'h094;
    stim[26] = 12'h261;
    stim[27] = 12'h20d;
    stim[28] = 12'h406;
    stim[29] = 12'h14f;
    stim[30] = 12'h74b;
    stim[31] = 12'h67e;
    stim[32] = 12'h039;
    stim[33] = 12'h5b1;
    stim[34] = 12'h358;
    stim[35] = 12'h2a8;
    stim[36] = 12'h008;
    stim[37] = 12'h5ec;
    stim[38] = 12'h78f;
    stim[39] = 12'h629;
    stim[40] = 12'h2dc;
    stim[41] = 12'h11a;
    stim[42] = 12'h7f5;
    stim[43] = 12'h46a;
    stim[44] = 12'h0f7;
    stim[45] = 12'h2e3;
    stim[46] = 12'h611;
    stim[47] = 12'h3cb;
    stim[48] = 12'h363;
    stim[49] = 12'h163;
    stim[50] = 12'h362;
    stim[51] = 12'h103;
    stim[52] = 12'h41e;
    stim[53] = 12'h1ea;
    stim[54] = 12'h77e;
    stim[55] = 12'h297;
    stim[56] = 12'h878;
    stim[57] = 12'h270;
    stim[58] = 12'h322;
    stim[59] = 12'h54b;
    stim[60] = 12'h738;
    stim[61] = 12'h6eb;
    stim[62] = 12'h66b;
    stim[63] = 12'h26a;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h100;
      expv[2] = 10'h100;
      expv[3] = 10'h11f;
      expv[4] = 10'h11f;
      expv[5] = 10'h11f;
      expv[6] = 10'h307;
      expv[7] = 10'h387;
      expv[8] = 10'h34b;
      expv[9] = 10'h3a5;
      expv[10] = 10'h3ae;
      expv[11] = 10'h3ae;
      expv[12] = 10'h399;
      expv[13] = 10'h399;
      expv[14] = 10'h399;
      expv[15] = 10'h399;
      expv[16] = 10'h399;
      expv[17] = 10'h399;
      expv[18] = 10'h399;
      expv[19] = 10'h199;
      expv[20] = 10'h325;
      expv[21] = 10'h332;
      expv[22] = 10'h332;
      expv[23] = 10'h332;
      expv[24] = 10'h39d;
      expv[25] = 10'h39d;
      expv[26] = 10'h39d;
      expv[27] = 10'h39d;
      expv[28] = 10'h39d;
      expv[29] = 10'h39d;
      expv[30] = 10'h39d;
      expv[31] = 10'h371;
      expv[32] = 10'h34b;
      expv[33] = 10'h34b;
      expv[34] = 10'h34b;
      expv[35] = 10'h34b;
      expv[36] = 10'h34b;
      expv[37] = 10'h34b;
      expv[38] = 10'h34b;
      expv[39] = 10'h3b1;
      expv[40] = 10'h3ec;
      expv[41] = 10'h3ec;
      expv[42] = 10'h3ec;
      expv[43] = 10'h38f;
      expv[44] = 10'h38f;
      expv[45] = 10'h38f;
      expv[46] = 10'h38f;
      expv[47] = 10'h3f5;
      expv[48] = 10'h3f5;
      expv[49] = 10'h3f5;
      expv[50] = 10'h3f5;
      expv[51] = 10'h3f5;
      expv[52] = 10'h3f5;
      expv[53] = 10'h3f5;
      expv[54] = 10'h3f5;
      expv[55] = 10'h1f5;
      expv[56] = 10'h1f5;
      expv[57] = 10'h100;
      expv[58] = 10'h100;
      expv[59] = 10'h100;
      expv[60] = 10'h17e;
      expv[61] = 10'h34b;
      expv[62] = 10'h338;
      expv[63] = 10'h138;
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
