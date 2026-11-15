// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_012159 dut (
    .EN(in_vec[32:32]),
    .IN1(in_vec[31:16]),
    .IN2(in_vec[15:0]),
    .Q(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h1a0d1393a;
    stim[1] = 33'h09300c222;
    stim[2] = 33'h1337d46af;
    stim[3] = 33'h039f30ea6;
    stim[4] = 33'h1a891b019;
    stim[5] = 33'h072744fe7;
    stim[6] = 33'h1cda6615a;
    stim[7] = 33'h15043b080;
    stim[8] = 33'h135072868;
    stim[9] = 33'h00bbc4217;
    stim[10] = 33'h1c8730d56;
    stim[11] = 33'h1b332b2ae;
    stim[12] = 33'h06eab4015;
    stim[13] = 33'h1b6c84844;
    stim[14] = 33'h012d9a4ed;
    stim[15] = 33'h1553eea1d;
    stim[16] = 33'h072dde618;
    stim[17] = 33'h0939f4295;
    stim[18] = 33'h02234da4b;
    stim[19] = 33'h0b1f2712e;
    stim[20] = 33'h0193ae9bf;
    stim[21] = 33'h0fa1f73ca;
    stim[22] = 33'h00a0f4f74;
    stim[23] = 33'h0b4c12f6d;
    stim[24] = 33'h14ac8c50a;
    stim[25] = 33'h1459d73c8;
    stim[26] = 33'h0fe17ec32;
    stim[27] = 33'h0345fc170;
    stim[28] = 33'h1402db111;
    stim[29] = 33'h0557e9362;
    stim[30] = 33'h13b2a3492;
    stim[31] = 33'h0d13dcbdd;
    stim[32] = 33'h126a03f51;
    stim[33] = 33'h0311d35e6;
    stim[34] = 33'h14803d9ba;
    stim[35] = 33'h18733bd91;
    stim[36] = 33'h0becf4d72;
    stim[37] = 33'h0da76d1b3;
    stim[38] = 33'h11b0fcde5;
    stim[39] = 33'h1625bfdcb;
    stim[40] = 33'h1c7c36800;
    stim[41] = 33'h1d9a0b47e;
    stim[42] = 33'h0718bef78;
    stim[43] = 33'h1187d64a1;
    stim[44] = 33'h0a90297e4;
    stim[45] = 33'h1e5af81e4;
    stim[46] = 33'h0d4648490;
    stim[47] = 33'h088b81efc;
    stim[48] = 33'h0cecff178;
    stim[49] = 33'h08f83eb60;
    stim[50] = 33'h128a023a1;
    stim[51] = 33'h0c469a516;
    stim[52] = 33'h0445b84c7;
    stim[53] = 33'h0c008d309;
    stim[54] = 33'h060ca46e9;
    stim[55] = 33'h0b1e73da9;
    stim[56] = 33'h148514600;
    stim[57] = 33'h1050dc232;
    stim[58] = 33'h100228578;
    stim[59] = 33'h00ee311ef;
    stim[60] = 33'h12dee2885;
    stim[61] = 33'h0c1edcda2;
    stim[62] = 33'h15dd021f9;
    stim[63] = 33'h06413ce06;
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
      expv[0] = 16'ha0d1;
      expv[1] = 16'hc222;
      expv[2] = 16'h337d;
      expv[3] = 16'h0ea6;
      expv[4] = 16'ha891;
      expv[5] = 16'h4fe7;
      expv[6] = 16'hcda6;
      expv[7] = 16'h5043;
      expv[8] = 16'h3507;
      expv[9] = 16'h4217;
      expv[10] = 16'hc873;
      expv[11] = 16'hb332;
      expv[12] = 16'h4015;
      expv[13] = 16'hb6c8;
      expv[14] = 16'ha4ed;
      expv[15] = 16'h553e;
      expv[16] = 16'he618;
      expv[17] = 16'h4295;
      expv[18] = 16'hda4b;
      expv[19] = 16'h712e;
      expv[20] = 16'he9bf;
      expv[21] = 16'h73ca;
      expv[22] = 16'h4f74;
      expv[23] = 16'h2f6d;
      expv[24] = 16'h4ac8;
      expv[25] = 16'h459d;
      expv[26] = 16'hec32;
      expv[27] = 16'hc170;
      expv[28] = 16'h402d;
      expv[29] = 16'h9362;
      expv[30] = 16'h3b2a;
      expv[31] = 16'hcbdd;
      expv[32] = 16'h26a0;
      expv[33] = 16'h35e6;
      expv[34] = 16'h4803;
      expv[35] = 16'h8733;
      expv[36] = 16'h4d72;
      expv[37] = 16'hd1b3;
      expv[38] = 16'h1b0f;
      expv[39] = 16'h625b;
      expv[40] = 16'hc7c3;
      expv[41] = 16'hd9a0;
      expv[42] = 16'hef78;
      expv[43] = 16'h187d;
      expv[44] = 16'h97e4;
      expv[45] = 16'he5af;
      expv[46] = 16'h8490;
      expv[47] = 16'h1efc;
      expv[48] = 16'hf178;
      expv[49] = 16'heb60;
      expv[50] = 16'h28a0;
      expv[51] = 16'ha516;
      expv[52] = 16'h84c7;
      expv[53] = 16'hd309;
      expv[54] = 16'h46e9;
      expv[55] = 16'h3da9;
      expv[56] = 16'h4851;
      expv[57] = 16'h050d;
      expv[58] = 16'h0022;
      expv[59] = 16'h11ef;
      expv[60] = 16'h2dee;
      expv[61] = 16'hcda2;
      expv[62] = 16'h5dd0;
      expv[63] = 16'hce06;
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
