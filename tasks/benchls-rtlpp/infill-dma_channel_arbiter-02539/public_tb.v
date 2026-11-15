// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02539 dut (
    .clk(clk),
    .reset(in_vec[30:30]),
    .enable(in_vec[29:29]),
    .joint_mode(in_vec[28:28]),
    .page_cross(in_vec[27:27]),
    .joint_req(in_vec[26:26]),
    .prio_top(in_vec[25:25]),
    .prio_high(in_vec[24:24]),
    .prio_top_num(in_vec[23:21]),
    .prio_high_num(in_vec[20:18]),
    .hold(in_vec[17:17]),
    .ch_ready(in_vec[16:9]),
    .ch_active(in_vec[8:1]),
    .finish(in_vec[0:0]),
    .ch_go_out(out_vec[4:4]),
    .ch_num(out_vec[3:1]),
    .ch_last(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h49899552;
    stim[1] = 31'h5402f48e;
    stim[2] = 31'h2ee30c96;
    stim[3] = 31'h29b05646;
    stim[4] = 31'h2ba4f4d8;
    stim[5] = 31'h2c090743;
    stim[6] = 31'h2dca1f6c;
    stim[7] = 31'h1eaab7dc;
    stim[8] = 31'h1cf40567;
    stim[9] = 31'h3b9d6a3e;
    stim[10] = 31'h36abee3c;
    stim[11] = 31'h1a792cca;
    stim[12] = 31'h241db0d0;
    stim[13] = 31'h1e4ae676;
    stim[14] = 31'h117b779d;
    stim[15] = 31'h39f3c34c;
    stim[16] = 31'h087a9c84;
    stim[17] = 31'h1c9d8d96;
    stim[18] = 31'h03c688d6;
    stim[19] = 31'h15ede259;
    stim[20] = 31'h309e18d1;
    stim[21] = 31'h3b857191;
    stim[22] = 31'h00f3bb85;
    stim[23] = 31'h056ad47f;
    stim[24] = 31'h0ad77691;
    stim[25] = 31'h24012b29;
    stim[26] = 31'h2202a756;
    stim[27] = 31'h06a7987e;
    stim[28] = 31'h026ce713;
    stim[29] = 31'h27f78930;
    stim[30] = 31'h25615f85;
    stim[31] = 31'h28f7ff57;
    stim[32] = 31'h1b7964db;
    stim[33] = 31'h29d0f18a;
    stim[34] = 31'h326dc72f;
    stim[35] = 31'h24e3d263;
    stim[36] = 31'h2bbbca24;
    stim[37] = 31'h277b1d40;
    stim[38] = 31'h3791132e;
    stim[39] = 31'h113449eb;
    stim[40] = 31'h1843a000;
    stim[41] = 31'h01ab8a99;
    stim[42] = 31'h1a3939d6;
    stim[43] = 31'h1a48deff;
    stim[44] = 31'h2dcce2c3;
    stim[45] = 31'h06fc8171;
    stim[46] = 31'h0be14b90;
    stim[47] = 31'h1061cfad;
    stim[48] = 31'h15d8c0ea;
    stim[49] = 31'h2ec9416f;
    stim[50] = 31'h3622fb97;
    stim[51] = 31'h3b7b229b;
    stim[52] = 31'h630da10a;
    stim[53] = 31'h3f91c046;
    stim[54] = 31'h2be9dc6e;
    stim[55] = 31'h2c50d025;
    stim[56] = 31'h07e5b7e4;
    stim[57] = 31'h101f3404;
    stim[58] = 31'h343b1e08;
    stim[59] = 31'h3e36aa1a;
    stim[60] = 31'h04531b83;
    stim[61] = 31'h3401a0e5;
    stim[62] = 31'h2992d545;
    stim[63] = 31'h26361546;
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
      expv[0] = 5'h11;
      expv[1] = 5'h11;
      expv[2] = 5'h11;
      expv[3] = 5'h11;
      expv[4] = 5'h11;
      expv[5] = 5'h11;
      expv[6] = 5'h11;
      expv[7] = 5'h11;
      expv[8] = 5'h11;
      expv[9] = 5'h11;
      expv[10] = 5'h11;
      expv[11] = 5'h11;
      expv[12] = 5'h11;
      expv[13] = 5'h11;
      expv[14] = 5'h11;
      expv[15] = 5'h11;
      expv[16] = 5'h11;
      expv[17] = 5'h11;
      expv[18] = 5'h11;
      expv[19] = 5'h11;
      expv[20] = 5'h11;
      expv[21] = 5'h11;
      expv[22] = 5'h11;
      expv[23] = 5'h11;
      expv[24] = 5'h11;
      expv[25] = 5'h11;
      expv[26] = 5'h11;
      expv[27] = 5'h11;
      expv[28] = 5'h11;
      expv[29] = 5'h11;
      expv[30] = 5'h11;
      expv[31] = 5'h11;
      expv[32] = 5'h11;
      expv[33] = 5'h11;
      expv[34] = 5'h11;
      expv[35] = 5'h11;
      expv[36] = 5'h11;
      expv[37] = 5'h11;
      expv[38] = 5'h11;
      expv[39] = 5'h11;
      expv[40] = 5'h11;
      expv[41] = 5'h11;
      expv[42] = 5'h11;
      expv[43] = 5'h11;
      expv[44] = 5'h11;
      expv[45] = 5'h11;
      expv[46] = 5'h11;
      expv[47] = 5'h11;
      expv[48] = 5'h11;
      expv[49] = 5'h11;
      expv[50] = 5'h11;
      expv[51] = 5'h11;
      expv[52] = 5'h11;
      expv[53] = 5'h11;
      expv[54] = 5'h11;
      expv[55] = 5'h11;
      expv[56] = 5'h11;
      expv[57] = 5'h11;
      expv[58] = 5'h11;
      expv[59] = 5'h11;
      expv[60] = 5'h11;
      expv[61] = 5'h11;
      expv[62] = 5'h11;
      expv[63] = 5'h11;
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
