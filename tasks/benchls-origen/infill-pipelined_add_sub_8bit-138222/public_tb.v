// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_138222 dut (
    .clk(clk),
    .rst(in_vec[18:18]),
    .A(in_vec[17:10]),
    .B(in_vec[9:2]),
    .carry_in(in_vec[1:1]),
    .sub(in_vec[0:0]),
    .sum(out_vec[8:1]),
    .borrow_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h782bd;
    stim[1] = 19'h6fa21;
    stim[2] = 19'h0e473;
    stim[3] = 19'h0b14a;
    stim[4] = 19'h2b0c9;
    stim[5] = 19'h2af3d;
    stim[6] = 19'h11e12;
    stim[7] = 19'h3b559;
    stim[8] = 19'h08346;
    stim[9] = 19'h06913;
    stim[10] = 19'h2a015;
    stim[11] = 19'h08b7a;
    stim[12] = 19'h13b76;
    stim[13] = 19'h05fbc;
    stim[14] = 19'h11f52;
    stim[15] = 19'h158dc;
    stim[16] = 19'h148a3;
    stim[17] = 19'h05e3e;
    stim[18] = 19'h35787;
    stim[19] = 19'h38886;
    stim[20] = 19'h23f4a;
    stim[21] = 19'h00700;
    stim[22] = 19'h1a973;
    stim[23] = 19'h121b4;
    stim[24] = 19'h39f17;
    stim[25] = 19'h2ff74;
    stim[26] = 19'h5ba3e;
    stim[27] = 19'h15687;
    stim[28] = 19'h3b278;
    stim[29] = 19'h037e7;
    stim[30] = 19'h33142;
    stim[31] = 19'h0e720;
    stim[32] = 19'h2f326;
    stim[33] = 19'h0bfa1;
    stim[34] = 19'h13fd7;
    stim[35] = 19'h2f035;
    stim[36] = 19'h0b1c9;
    stim[37] = 19'h02ce8;
    stim[38] = 19'h0a424;
    stim[39] = 19'h34675;
    stim[40] = 19'h10678;
    stim[41] = 19'h382c5;
    stim[42] = 19'h343b3;
    stim[43] = 19'h1f5a2;
    stim[44] = 19'h17550;
    stim[45] = 19'h03db6;
    stim[46] = 19'h3460c;
    stim[47] = 19'h314b3;
    stim[48] = 19'h0675f;
    stim[49] = 19'h1ea37;
    stim[50] = 19'h3a806;
    stim[51] = 19'h1b696;
    stim[52] = 19'h39730;
    stim[53] = 19'h3c287;
    stim[54] = 19'h117ec;
    stim[55] = 19'h1838f;
    stim[56] = 19'h197b0;
    stim[57] = 19'h35ef2;
    stim[58] = 19'h07f2f;
    stim[59] = 19'h08ec0;
    stim[60] = 19'h25a3c;
    stim[61] = 19'h2e5a7;
    stim[62] = 19'h3dd8b;
    stim[63] = 19'h23183;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h001;
      expv[5] = 9'h038;
      expv[6] = 9'h0ff;
      expv[7] = 9'h0f5;
      expv[8] = 9'h1b9;
      expv[9] = 9'h199;
      expv[10] = 9'h12e;
      expv[11] = 9'h1e5;
      expv[12] = 9'h1aa;
      expv[13] = 9'h146;
      expv[14] = 9'h003;
      expv[15] = 9'h059;
      expv[16] = 9'h00d;
      expv[17] = 9'h039;
      expv[18] = 9'h11b;
      expv[19] = 9'h052;
      expv[20] = 9'h14f;
      expv[21] = 9'h1e7;
      expv[22] = 9'h009;
      expv[23] = 9'h0c5;
      expv[24] = 9'h183;
      expv[25] = 9'h01a;
      expv[26] = 9'h000;
      expv[27] = 9'h000;
      expv[28] = 9'h000;
      expv[29] = 9'h001;
      expv[30] = 9'h167;
      expv[31] = 9'h114;
      expv[32] = 9'h027;
      expv[33] = 9'h03b;
      expv[34] = 9'h003;
      expv[35] = 9'h10c;
      expv[36] = 9'h08e;
      expv[37] = 9'h0b2;
      expv[38] = 9'h15f;
      expv[39] = 9'h175;
      expv[40] = 9'h08a;
      expv[41] = 9'h065;
      expv[42] = 9'h068;
      expv[43] = 9'h1bf;
      expv[44] = 9'h05f;
      expv[45] = 9'h1c7;
      expv[46] = 9'h1cc;
      expv[47] = 9'h162;
      expv[48] = 9'h0fa;
      expv[49] = 9'h0a8;
      expv[50] = 9'h131;
      expv[51] = 9'h082;
      expv[52] = 9'h1d9;
      expv[53] = 9'h1d8;
      expv[54] = 9'h027;
      expv[55] = 9'h162;
      expv[56] = 9'h09c;
      expv[57] = 9'h080;
      expv[58] = 9'h0f9;
      expv[59] = 9'h0a3;
      expv[60] = 9'h128;
      expv[61] = 9'h0a7;
      expv[62] = 9'h1a6;
      expv[63] = 9'h04a;
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
