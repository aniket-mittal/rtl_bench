// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 26;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  spi_master_rx dut (
    .clk(clk),
    .rstn(in_vec[25:25]),
    .en(in_vec[24:24]),
    .rx_edge(in_vec[23:23]),
    .sdi0(in_vec[22:22]),
    .sdi1(in_vec[21:21]),
    .sdi2(in_vec[20:20]),
    .sdi3(in_vec[19:19]),
    .en_quad_in(in_vec[18:18]),
    .counter_in(in_vec[17:2]),
    .counter_in_upd(in_vec[1:1]),
    .data_ready(in_vec[0:0]),
    .rx_done(out_vec[34:34]),
    .data(out_vec[33:2]),
    .data_valid(out_vec[1:1]),
    .clk_en_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 26'h13e7419;
    stim[1] = 26'h1958ef0;
    stim[2] = 26'h2699735;
    stim[3] = 26'h3c5e639;
    stim[4] = 26'h2d5e3b6;
    stim[5] = 26'h206dba7;
    stim[6] = 26'h2a66aea;
    stim[7] = 26'h0e3530f;
    stim[8] = 26'h30de7f0;
    stim[9] = 26'h37cf4e9;
    stim[10] = 26'h2811a4f;
    stim[11] = 26'h21e962f;
    stim[12] = 26'h289f630;
    stim[13] = 26'h25ed8f3;
    stim[14] = 26'h3c11669;
    stim[15] = 26'h2f4bf9b;
    stim[16] = 26'h30a705c;
    stim[17] = 26'h36c3708;
    stim[18] = 26'h2092184;
    stim[19] = 26'h342a0ff;
    stim[20] = 26'h2f7968e;
    stim[21] = 26'h24b65de;
    stim[22] = 26'h24bd625;
    stim[23] = 26'h254e937;
    stim[24] = 26'h3d807d8;
    stim[25] = 26'h32d1bb4;
    stim[26] = 26'h2927631;
    stim[27] = 26'h39c967c;
    stim[28] = 26'h2bf9e96;
    stim[29] = 26'h2bfc6cb;
    stim[30] = 26'h2bfe95c;
    stim[31] = 26'h2ec71db;
    stim[32] = 26'h26922ab;
    stim[33] = 26'h324dcc5;
    stim[34] = 26'h259035e;
    stim[35] = 26'h34eda43;
    stim[36] = 26'h257bd4c;
    stim[37] = 26'h33cc43f;
    stim[38] = 26'h24b3d1c;
    stim[39] = 26'h261f411;
    stim[40] = 26'h25d5a64;
    stim[41] = 26'h3abce07;
    stim[42] = 26'h36c9fe4;
    stim[43] = 26'h2a46a34;
    stim[44] = 26'h29bd8b4;
    stim[45] = 26'h343353e;
    stim[46] = 26'h32c948f;
    stim[47] = 26'h2115cb9;
    stim[48] = 26'h358692e;
    stim[49] = 26'h20ad5e0;
    stim[50] = 26'h336e057;
    stim[51] = 26'h3f1609d;
    stim[52] = 26'h1656a47;
    stim[53] = 26'h21ae536;
    stim[54] = 26'h25ab0fa;
    stim[55] = 26'h2498fdf;
    stim[56] = 26'h20df65a;
    stim[57] = 26'h25656b4;
    stim[58] = 26'h3250db5;
    stim[59] = 26'h30acb6e;
    stim[60] = 26'h3da0245;
    stim[61] = 26'h3140a70;
    stim[62] = 26'h2f5b792;
    stim[63] = 26'h24a09fd;
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
      expv[0] = 35'h000000000;
      expv[1] = 35'h000000000;
      expv[2] = 35'h000000000;
      expv[3] = 35'h000000000;
      expv[4] = 35'h000000015;
      expv[5] = 35'h000000015;
      expv[6] = 35'h000000149;
      expv[7] = 35'h000000000;
      expv[8] = 35'h000000000;
      expv[9] = 35'h000000001;
      expv[10] = 35'h000000001;
      expv[11] = 35'h000000001;
      expv[12] = 35'h000000001;
      expv[13] = 35'h000000001;
      expv[14] = 35'h000000001;
      expv[15] = 35'h00000001d;
      expv[16] = 35'h00000001d;
      expv[17] = 35'h00000001d;
      expv[18] = 35'h00000001d;
      expv[19] = 35'h00000001d;
      expv[20] = 35'h0000001dd;
      expv[21] = 35'h0000001dd;
      expv[22] = 35'h0000001dd;
      expv[23] = 35'h0000001dd;
      expv[24] = 35'h0000003b9;
      expv[25] = 35'h0000003b9;
      expv[26] = 35'h000000771;
      expv[27] = 35'h000007732;
      expv[28] = 35'h000007732;
      expv[29] = 35'h000007732;
      expv[30] = 35'h000077339;
      expv[31] = 35'h0007733ad;
      expv[32] = 35'h0007733ad;
      expv[33] = 35'h0007733ad;
      expv[34] = 35'h0007733ad;
      expv[35] = 35'h0007733ad;
      expv[36] = 35'h0007733ad;
      expv[37] = 35'h0007733ad;
      expv[38] = 35'h0007733ad;
      expv[39] = 35'h0007733ad;
      expv[40] = 35'h0007733ad;
      expv[41] = 35'h000ee675d;
      expv[42] = 35'h000ee675d;
      expv[43] = 35'h00ee675c9;
      expv[44] = 35'h01dcceb91;
      expv[45] = 35'h01dcceb91;
      expv[46] = 35'h01dcceb91;
      expv[47] = 35'h01dcceb91;
      expv[48] = 35'h01dcceb91;
      expv[49] = 35'h01dcceb91;
      expv[50] = 35'h01dcceb91;
      expv[51] = 35'h03b99d725;
      expv[52] = 35'h000000000;
      expv[53] = 35'h000000000;
      expv[54] = 35'h000000000;
      expv[55] = 35'h000000000;
      expv[56] = 35'h000000000;
      expv[57] = 35'h000000000;
      expv[58] = 35'h000000000;
      expv[59] = 35'h000000001;
      expv[60] = 35'h000000001;
      expv[61] = 35'h000000001;
      expv[62] = 35'h00000001d;
      expv[63] = 35'h00000001d;
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
